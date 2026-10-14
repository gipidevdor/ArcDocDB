(:FINISHED-AT-UNIVERSAL-TIME 4000985543 :CONFIG-SHA256-AFTER
 "08e806c05beff12477c29aa2f4b7ad3975c37013b983230b6fb4adf3ac51f8a2"
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
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/support.fasl"
   :FASL-SHA256
   "0ca6f0c726a2d48ad5b08f7400874eb5b0165f3793c609e916cab59167207507")
  (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/native.fasl"
   :FASL-SHA256
   "b5605fd9e71bbce039f7579baf584a0c7e7d882b480ac7594a007ddf8da21849")
  (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/group.fasl"
   :FASL-SHA256
   "6c8cbee8eefb2a29b1170d95244dccbc54da6dea6f5fc6ba82f051fae681cd9e")
  (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/fault.fasl"
   :FASL-SHA256
   "005792bac8d96f8d9d192ba840e3c98be64580c91830e27ff6d6a81198dbf98f")
  (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/csn.fasl"
   :FASL-SHA256
   "4cfc400a9455f91bc2744ddb539298f5aea023d2381b95b152b495ddfe8ac1a3")
  (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/csn-threads.fasl"
   :FASL-SHA256
   "1f059d3a71688e6ee0fd5d057999025b4f1b2b4fd36332b435209cb94b5f21d1")
  (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/wal/builder.fasl"
   :FASL-SHA256
   "7f781465ee400449b78e97aa2c6eb96a02bae6abcd602531ac5de822177f3a28")
  (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/support.fasl"
   :FASL-SHA256
   "bb4f5a3520f8b108695a3fdc5ddf95e9a46a140f82277def083f148c3424a2a6")
  (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/segment-header.fasl"
   :FASL-SHA256
   "445f0b511234cce6e03c8a7868554d9995bf33dcf7e5b641366c0e4d967c4551")
  (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/log-header.fasl"
   :FASL-SHA256
   "07fd57ac1a7e80791d0689c45544ccac0fbd1364e6f514d511ebdde7e65bc2f5")
  (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/control-payload.fasl"
   :FASL-SHA256
   "3274ce84e47eb8de9c8abda05c6d14c46d3d06e470f6b281b76e6b5653800bce")
  (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/storage/compaction-scan.fasl"
   :FASL-SHA256
   "e2510cc12f5e77fef4cf3f18918204ac1008bce3ce405792602e7441195b75fb")
  (:FILE "tests/smoke.lisp" :SOURCE-SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/smoke.fasl"
   :FASL-SHA256
   "4e1d599658c606f9b4d1014b5858e74af6b23a642de35077d5ef6823b6a66669")
  (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/worker-routing.fasl"
   :FASL-SHA256
   "e31b9307758e9b9372de9d3dcbf1506af02bc38f49d71fbef454deef98c9b153")
  (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/worker-bridge.fasl"
   :FASL-SHA256
   "a87572ebe8a56e22f06a13062c6928da42b1485e0c7cee963469e38d6286ce48")
  (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/threads.fasl"
   :FASL-SHA256
   "1fc2b14f049b380ce42233493a487b5b1225c25ffb27b350c1bfb02d9bdfb3cb")
  (:FILE "tests/series/support.lisp" :SOURCE-SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/support.fasl"
   :FASL-SHA256
   "f81b964fcfb45f22f68147a35ad7912c773a0fd6fef98123fd99f7d088bb76b1")
  (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/controller.fasl"
   :FASL-SHA256
   "073d4b38397f1d3a2c86d2a919cce21d2da0274b451a59d17a678e1ce504ae41")
  (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/series/boundaries.fasl"
   :FASL-SHA256
   "2976864a2b7afbd1ffcf49b6b635e7b53cc2ea359ec166b552dfd4caf27ffb38")
  (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/support.fasl"
   :FASL-SHA256
   "5d0b1d0230905daef0f0082c93e8c05fb10b76979ee704a4cad0e76a376fc2fd")
  (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "96fa4265ee87f3896ab07e2cd97959907ec02fc3aac8b4f9d62c61e9a92312d6")
  (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/lifecycle.fasl"
   :FASL-SHA256
   "3701945072dea6b25847f16a72f893b2c8828a404f9b21e11a43ce5d28000640")
  (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
   "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/dispatch.fasl"
   :FASL-SHA256
   "c61c1b5a4fdc07c513566bab3d116dcb6a1b6dffa511b9c9668059b261469ae7")
  (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/scheduler/controller.fasl"
   :FASL-SHA256
   "e1506f001505b056107053a1e2f896750809d80ec8bed596d9026cbba919af42")
  (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/support.fasl"
   :FASL-SHA256
   "57350b54ea9ebf133f53f79253f5834c3c7d809e6ca5014753a7c3f4391df6b4")
  (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/scan.fasl"
   :FASL-SHA256
   "08a1604acf3bf9a8d10fcd1172bbabdcc62d619f0cad571652731c63149f09bd")
  (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest.fasl"
   :FASL-SHA256
   "cb3cdaaf98c5cf804b76317fadd891be26d2a0630864f904bde8c403fe82dec8")
  (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest-support.fasl"
   :FASL-SHA256
   "88c3430486cc71ac7324622096761dd46d8353957c03ccd10a4a9f0311b54984")
  (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/manifest-audit.fasl"
   :FASL-SHA256
   "7446974b647680ccf02eaf6df0e39050faff039367c680bc03b82eda0ddd213d")
  (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/inventory.fasl"
   :FASL-SHA256
   "a515a6cb26746ba4f14110c146b6a4fed2618f832f1f282ff50f38f8801482ed")
  (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/inventory-support.fasl"
   :FASL-SHA256
   "b966b8f1897f7ee3557d9b08e9e5077c0f2adcba45c0ccf9b0d2f2278f6f1e17")
  (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions.fasl"
   :FASL-SHA256
   "c8f6c10d7de307d98ac4f1cce671b76cca852adff97ccfad4f73ef751cfc311a")
  (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-support.fasl"
   :FASL-SHA256
   "384db0d879826f37c9808bbe82b1d0b2f3c799db13f74eef226d2c886707f4f6")
  (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "f6763157f7e293799cdacd3ff5d6256692b57a570b9cc74dad8b9523a10a55b0")
  (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/decisions-audit.fasl"
   :FASL-SHA256
   "c1aaea74da97af8ee683b2a94b0785a9af54ebd89dc125288cbcc2ad7513311f")
  (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/recovery/corruption.fasl"
   :FASL-SHA256
   "80af846c20a357f7d80509b62c3fc57af25b0d98c598620f2d862acedcfa7588")
  (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/threads.fasl"
   :FASL-SHA256
   "3fa3f556b9c14de8faaa2b34a26bb9f8ee12640ce8149f1e5ee114c5fe619ab7")
  (:FILE "tests/read/support.lisp" :SOURCE-SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/support.fasl"
   :FASL-SHA256
   "d46e394a7c123916e4faa3187b30d590c1095ad9431ce998b9df3218f848c51c")
  (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/read/lifecycle.fasl"
   :FASL-SHA256
   "2b1427f3e2c7c385adf73ffb5d7b79b3d504d550d6126cf2e8de2226cbeaa99d")
  (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/support.fasl"
   :FASL-SHA256
   "4148a9ce3ee2c7ca79721d10410f4ca20814219faaeafee4e81a15aecd4bb665")
  (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/lifecycle.fasl"
   :FASL-SHA256
   "be337c6f5e997b1e8930715bfa9ab949bb7767778c391d58f1ba0b4e2e277a2d")
  (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/mvcc/capture.fasl"
   :FASL-SHA256
   "68fbd4bae5ab18776d47aef261f935a9d230d5558ca843d475da04c755dd92e9")
  (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/transfer.fasl"
   :FASL-SHA256
   "edf33c52d4920282c84aa959e002f83d151b9e092e5ad8aa3996cc614a995a4e")
  (:FILE "tests/io/support.lisp" :SOURCE-SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/support.fasl"
   :FASL-SHA256
   "e323f515891d3aab8dda549535f14144ae68a8dfb42301a88126aebedb1db1bc")
  (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
   "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/rename.fasl"
   :FASL-SHA256
   "fce1d1fa162531e5a5e39d6b03e9b131bfff99226c491a88812b1d3896b367cc")
  (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
   "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/rename-native.fasl"
   :FASL-SHA256
   "cb5042b968efe9a7e95ffd6d2345e600bacc8ef8ce97844ed9de03efb2415fdb")
  (:FILE "tests/io/native.lisp" :SOURCE-SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/io/native.fasl"
   :FASL-SHA256
   "45b6faba963aef367db29ac6ce8c4bffdb4f37830b8a9e7de0976038be339dc6")
  (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slots.fasl"
   :FASL-SHA256
   "7b3c0bb75d454cff376133f1d1ebbb676c57e3d97604a85ee771c193d86dd528")
  (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slot-threads.fasl"
   :FASL-SHA256
   "29cf73e34fc0e843d608eac454cd82d3586ed3b795ced65db5a91a3720d43021")
  (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/slot-support.fasl"
   :FASL-SHA256
   "b30057e3425eb7d283cec369fdbeb0560b82ec33ceac8b96da5c559e7aacbc1d")
  (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/rebuild.fasl"
   :FASL-SHA256
   "369624bdd9aa665b18c17e08fc9a00c0217aa9ca2b5fe6bff30d7181405e6cee")
  (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary.fasl"
   :FASL-SHA256
   "7739f16c39013bb1663b7e0209be6b3bf19f758a637debbaf8189fd8bcb9fe74")
  (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary-threads.fasl"
   :FASL-SHA256
   "7771404df3a88753738db690cd7695c90f9af7f5296a4c2e2638885fd641418c")
  (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/primary-support.fasl"
   :FASL-SHA256
   "47feb5ded23ddae3136469e2b57362f57f6287fa7eef28d3e22b880ae8f5242f")
  (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/index/hash-digests.fasl"
   :FASL-SHA256
   "02f0a51bb89f22d99a720fdbc0587333f73613e0071a21215cbb7b83085f56a7")
  (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/threads.fasl"
   :FASL-SHA256
   "df35cf79c87f8abae16794ba4878bc872f7c518ac23c240773013d64859d5e9d")
  (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/support.fasl"
   :FASL-SHA256
   "263f543a53b5f1fac12e5d4bb756a15f0da8e55f1bf80b64c875798e6cd38c2f")
  (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/hash64.fasl"
   :FASL-SHA256
   "94987a3c92afee4727fd43e3b5b396f742214eee1117e44f1ead8488dd180ae7")
  (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/hash/guards.fasl"
   :FASL-SHA256
   "183d513d49099083478905071c9d5d9a364ef9f5ac3eeee957393ff8b7003e82")
  (:FILE "tests/get/support.lisp" :SOURCE-SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/support.fasl"
   :FASL-SHA256
   "6c890f83db8a257c62edcc3b05062cb61796594baeee43c3765efa18d27cef7e")
  (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/segment.fasl"
   :FASL-SHA256
   "98bbbea7a0cb368a912d8876a1d9225103aa9e1c8bf7d9c63527749fc5f8342b")
  (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get/lifecycle.fasl"
   :FASL-SHA256
   "84525c99d578ea658e835ea1e47c71fc76ca4cb33ae36a9e261e04a5423e1a65")
  (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/support.fasl"
   :FASL-SHA256
   "43445ca61218ed93bbb0d6e494620b5b49f80089e3c41299301ab904e698427b")
  (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/sort.fasl"
   :FASL-SHA256
   "730942c498e30d9715a325a38980788e0320ab17f8c242911e67d5dec92a39d9")
  (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/read.fasl"
   :FASL-SHA256
   "04629aecbd0bf0b2eba7608cb5fe2a9fc4398f14c56f35c4f83bdbf5a0e3e384")
  (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-resolver/construction.fasl"
   :FASL-SHA256
   "4d3f5ed393bbc07bed04d32a270726ca6b403395bb7058974a0347fcaff26c70")
  (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/threads.fasl"
   :FASL-SHA256
   "4c37c8ef5518310b389a424cdd9c9e9b7b2e56ced62bbff9df7a9ec0bfaa53f6")
  (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/support.fasl"
   :FASL-SHA256
   "93cdd2d9f5f21b22a66d1a9c9381b6bc09a12971865a72a5338d348c140faab4")
  (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/paths.fasl"
   :FASL-SHA256
   "59dfab40763030d83aa4427062f708a21c0913321182af9cd8e71ae3983e77ec")
  (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-performance/guards.fasl"
   :FASL-SHA256
   "982cee6ef8b86a531b2d53ee131d86f504f3d47c1cdc0b2aab134f8dafe89e0d")
  (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/threads.fasl"
   :FASL-SHA256
   "1341a4b341464c85c8dcdf3c1dd49f81058b1d6b66d2e648747d844f85308ed0")
  (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/support.fasl"
   :FASL-SHA256
   "453a1fbea98bff8a758a9f2c09fb20df9530facc5254603b05f922472002ffde")
  (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/series-support.fasl"
   :FASL-SHA256
   "2b0ea1a382a58bd50411819d0860b0101419563fb49e2811fe8bd27577a767cf")
  (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/series-read.fasl"
   :FASL-SHA256
   "6524c13ffcf79d1f67eb54965957a389ca65972fc800a09431ea153d58771263")
  (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/read.fasl"
   :FASL-SHA256
   "3ff544add5d1e7950ce18a3bab9c21fe2b49568acbe6049974c46a01451528f6")
  (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-directory/construction.fasl"
   :FASL-SHA256
   "7495ef02045ee61ccf9c329eedf66678b95835387a3ba10369ca5182e2f497eb")
  (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
   "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-active/support.fasl"
   :FASL-SHA256
   "cf4d434218d900af5b491041b778975bb8fc5359da64d510894e1a082f26584a")
  (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
   "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-active/read.fasl"
   :FASL-SHA256
   "6c08f70ea807a605b362a1c7983790fe057f5bb1f5a856583c98f71c253a6ce8")
  (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
   "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-active/preflight.fasl"
   :FASL-SHA256
   "f5e298ae62aedbed1b78fd597e608a0596d11f3a1e5e3bd74eeb394b719940a5")
  (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
   "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-active/directory.fasl"
   :FASL-SHA256
   "063b37d5cfb08d44c56d408a31b70b4310581052c893774881853644c42c1597")
  (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
   "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/get-active/construction.fasl"
   :FASL-SHA256
   "9155cdfcd2f77eb293631df9b1f6de428350450dc855aa10ee605705866430bd")
  (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/support.fasl"
   :FASL-SHA256
   "e3f6ddf583cb1e392a7217648515bed708d98b10e7195efe99b40a634d4eed64")
  (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/record.fasl"
   :FASL-SHA256
   "b6dddc5ff00e0a2b478b6ca911170ced4adf4d8ddba991ab19cba6b3da203ce3")
  (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/binary.fasl"
   :FASL-SHA256
   "4f2c04733b7c71bda3847c2de673ba709c3402a557b86c114b968da892892a51")
  (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/foundation/batch.fasl"
   :FASL-SHA256
   "945b0cf5d3e5b4c4c3be1256c3f10a923f788ca7be7d788287f123d13387e999")
  (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/worker.fasl"
   :FASL-SHA256
   "713297a7be363ffd1408331809a66b5339b11821e3bea5e589ab109c99d55c31")
  (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/threads.fasl"
   :FASL-SHA256
   "777feeb7c6ea69cba1a34d74f7b133b01ea1c877e5ab2fdea905c97b48e8c281")
  (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/support.fasl"
   :FASL-SHA256
   "95ce5c322cbb974ad8a34831f848297430d3b977408889db1c817e7364687a04")
  (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/ready.fasl"
   :FASL-SHA256
   "74beffd6b8e7d865d58da0ffa69ebbf9c5c3386ce3627774a4c93c0deebf6b8e")
  (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/ready-recycle.fasl"
   :FASL-SHA256
   "be192579da3b9954bebcafbcfd6d9d5da893143a1b03b2a9ebad09f4fbb47aa9")
  (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/queue.fasl"
   :FASL-SHA256
   "d105077ab2fcf60ab808f519f04c0a41690f2cfd149a6e6863a835fe948f7e5f")
  (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/execution/handoff.fasl"
   :FASL-SHA256
   "ac795aa4ebda5d764fa22ae8461230f441659884836ea5bf5e8eb9d3833688cd")
  (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/threads.fasl"
   :FASL-SHA256
   "83fba2965b56db4988e22238515569f83b54aa131a6b51f31fe6068bdedd5856")
  (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/support.fasl"
   :FASL-SHA256
   "805883168e0df6e961c60a387f81b878b6d33275115d1383ecb06f1be613e604")
  (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/epochs/lifecycle.fasl"
   :FASL-SHA256
   "ca346d3b36413cee03c11082cea7d28d31fa3248ce158e2ffe487e4ac9f4841f")
  (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/threads.fasl"
   :FASL-SHA256
   "879c21e6d42771142cf5ac5af2c23ef60e198227cd863d3fce9f9a5169a916c0")
  (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/support.fasl"
   :FASL-SHA256
   "8c41206e06d81ed524f9e6af62f309d83a00de009635dc35bf69ebf95a947868")
  (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/csn/registry.fasl"
   :FASL-SHA256
   "bc6fe561db4495549e6982e7392ffda42941a61f88c1ea2ff736fb6ab4c41cfa")
  (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/utf8.fasl"
   :FASL-SHA256
   "a216bb238502618563bc3e7296429675794754f753d33da96bb875e7a9c81900")
  (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/threads.fasl"
   :FASL-SHA256
   "d5af405824241eceee69d29b64d90f84a6b33d37178d05032ac252667f824924")
  (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/support.fasl"
   :FASL-SHA256
   "7ee21db0cfc5b5e43b68aef9ca2453a2f20be285077c6ae54577e11717c30372")
  (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write.fasl"
   :FASL-SHA256
   "242d522d742349871c6b15ee769ec3ad468a0b1bbda5bcc35e7fef54a0c0946f")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-threads.fasl"
   :FASL-SHA256
   "889c4b95b2e9768069fa59dabeb8b19e51532b252c92ffd9dd1cb41e4ab8dff5")
  (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-support.fasl"
   :FASL-SHA256
   "ac783b2258521c90c5b1ae16e83ef39ed537e8a9c9456cad3156478d748c472e")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :FASL-SHA256
   "4601dafb2fc4f23ee87d6945a60e66b76c632d718e459650de2c120f0459d0fc")
  (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-threads.fasl"
   :FASL-SHA256
   "0bc8e84cc1bf8719c5d0510024e2fbc63ae1f9211d2d0288859636784d794226")
  (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-support.fasl"
   :FASL-SHA256
   "e61fd288eb16ac8484b1548e8d6d3a96966740a04440b6db396ecb31524014b4")
  (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure.fasl"
   :FASL-SHA256
   "5a27cb178f2c686998b6182c7f9552713c5ed457eda49a1009ee975ae35a88b4")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure-threads.fasl"
   :FASL-SHA256
   "d203a733b67e0e069f48d9e6afcb9c1df1ddb9e684db3e30e6d45795a5e69fa2")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-structure-support.fasl"
   :FASL-SHA256
   "2e13f3240dab7e36b8edb26d0e5d76f313f08753a42b33e62c3f06a29c8c8697")
  (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "258de06f3088d60b59101662411756b1bc6ccbdeb902eb6af712e807f4c48985")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write-threads.fasl"
   :FASL-SHA256
   "2c11d76c1f9294bd3532d790d88aff2ea7a555d049992f8d6f285cf2cfd70827")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-string-write-support.fasl"
   :FASL-SHA256
   "4994006d11e0d8727f2e2b7d55283f76775fe5112e3f303ae1289363e55a3fbf")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "ca56e177ad537cab1faa5cf6330bde5733ae283f45237309121c1ef5dfff175e")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :FASL-SHA256
   "5c1d6077a68cc57062962c2aee38f074cf00bd7ffdf0341024c9e81d44bd8dc9")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-simple-write-support.fasl"
   :FASL-SHA256
   "14813fe02edf7f26ccad10fe935c13b9c1235538202a570fc0bef2f594c93b8f")
  (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "23202ffbc65364854c672ca3d30d654646ff34929423e3425cb1ee963988356c")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-threads.fasl"
   :FASL-SHA256
   "694284ec2f7d1ceb9d2aa46d9a16b3162efa0e286eb6c895a5b7f13541543e96")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-support.fasl"
   :FASL-SHA256
   "f2dc1be3a9513d667f77c6cd8ecaec2d887a10ebf62fa0e8e2dabe854d9a9b45")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan.fasl"
   :FASL-SHA256
   "30b14e767873aaaf0bc244025c0c1530e5429fe759d03a5517909a9d27a372e2")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :FASL-SHA256
   "fe3cb22ae32ce24b19c44d3811072667c34a1137e3dbf9d10175b65314eaf555")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :FASL-SHA256
   "a9ab95f71f9858519b02568345a4685db233482a7a2d6bd3e162ffba0a333b46")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-minimal-edges.fasl"
   :FASL-SHA256
   "04d86e33004c0ad7484e3f9561611581a0112ab2c547494ebc16f7aa83a31461")
  (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-header.fasl"
   :FASL-SHA256
   "091a82c29dfc520fb0111a2c6c2ded09a3624fc89de36c3d9f7d60cdc9217d86")
  (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "1adffd8e4876f8cbfbd76df1a2d39d3044c9e4bb2d3e5314e090bfaee9daef5c")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write-threads.fasl"
   :FASL-SHA256
   "fa1ccc18256b0d1013bdf5292eda9e4fc663480878c667dfa161d55a8dfebfe4")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-float-write-support.fasl"
   :FASL-SHA256
   "56b84504dca7dcfe2c60ec976970e34e99e4e4d1f98b730dd18d563e95a41d3c")
  (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "c01396f0a8b51963938019b0da82b0adf2f2e8846e2595b5559cdcc36ab5f528")
  (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
   "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-array-write-threads.fasl"
   :FASL-SHA256
   "640bd405a85713eec717bee4d4d58edf83c475d06a6fcea60c26be9c7648e99a")
  (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
   "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/tests/codec/cbor-array-write-support.fasl"
   :FASL-SHA256
   "e12e50acd0a69663858a5107d3f6545d6933f8030ccb384b59bddbf028d8a24b")
  (:FILE "src/wal/types.lisp" :SOURCE-SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/types.fasl"
   :FASL-SHA256
   "ff67f7a2c1487cf20393beb6bf7db8e2b0998977bc79147feb9e1ab56ec1860e")
  (:FILE "src/wal/package.lisp" :SOURCE-SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/package.fasl"
   :FASL-SHA256
   "ac9834480a63cdc04b994e3bc012acba1453f0e30a2140d8c56087443c5f94c4")
  (:FILE "src/wal/group.lisp" :SOURCE-SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/group.fasl"
   :FASL-SHA256
   "143ffef828dae96f26eae4f2e470be3bc188d0d48ae61a17dbfdede307ef53fc")
  (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/executor.fasl"
   :FASL-SHA256
   "f19b33767e03b67a9d42cc92a059990d86cc261b7660ac4614a5daa01fdf45c9")
  (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/csn.fasl"
   :FASL-SHA256
   "29d25f57f78ebcc2b742cfee998c52f8a8fc1d53624fdc3b3fae7b42b381f55b")
  (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/wal/builder.fasl"
   :FASL-SHA256
   "83ad98365d8ace7455b2d236d038cc6d44f63e2a15a174bb13918a9023087751")
  (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/segment-header.fasl"
   :FASL-SHA256
   "b9cc6e9a048d93dbf720fefd95975fc8ed7d2127329c3dee0305d7a629520e99")
  (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/payload-write.fasl"
   :FASL-SHA256
   "6811fc3d5be384dde70568b38578fbdfc2d526af5a18443fee8ca74778349d19")
  (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/payload-record.fasl"
   :FASL-SHA256
   "2530f9633ea3391dd3515e64e7e828ed89c6f25b2ddc36e1457b7f77f4d9680c")
  (:FILE "src/storage/package.lisp" :SOURCE-SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/package.fasl"
   :FASL-SHA256
   "4d17c11443c03cf3599299001e6fdfc73b864e7f437e8a55e272ff586f667a22")
  (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/log-header.fasl"
   :FASL-SHA256
   "1ad8764f24249c79408d9f1d279a618598ab95257089310305826fa460524c48")
  (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/formats.fasl"
   :FASL-SHA256
   "8d405af0394cc4d79e0bdce1ed605a4ba3d760dc5ee91061c5b22619dda3d9b6")
  (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/control-payload.fasl"
   :FASL-SHA256
   "a447b2a9da88655f46900dff5c4210818967a69293cb2c06c522f4e6e0cdce2c")
  (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/storage/compaction-scan.fasl"
   :FASL-SHA256
   "aaf155a0d594d71112986738f9b609cf1e9f3b8bb2292397b408d0a245208a2a")
  (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-types.fasl"
   :FASL-SHA256
   "c9b4fb9d38d8a7710c06ab3bde30585339a1197772b11d7e43e05b20143ca9e7")
  (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-run.fasl"
   :FASL-SHA256
   "9d3e40050cf5b8753b0680164a2bde1ae009a78d95a425900de9c2546a658680")
  (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-package.fasl"
   :FASL-SHA256
   "59bf653418fb4d9cccabc9f27dd3d96c3aa7a36e0d1bde78f7db1c7b898306e6")
  (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/worker-boundary.fasl"
   :FASL-SHA256
   "4fca4a6983b7e97eb440221911a2d93837415e1835e121fbfa042ee435401f9c")
  (:FILE "src/series/types.lisp" :SOURCE-SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/types.fasl"
   :FASL-SHA256
   "6af2a876264e1ecd6cdadd12d8cf4e2f42c66dfb3245f325125c881c585b7bd0")
  (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-types.fasl"
   :FASL-SHA256
   "20a88cf8fb5db9fd09693f49a5d6e208e9c519f66a8605ff6f94bb062465520e")
  (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-select.fasl"
   :FASL-SHA256
   "8a0087dc42bce343de26bedf4034dfa9a0203f235dbcdac3c580f54663e5927c")
  (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/routing-build.fasl"
   :FASL-SHA256
   "19d954c898e1f59fd74abc5c2104de1d3b0860099ca412bbafbcd427ca7bb1c0")
  (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/retirement.fasl"
   :FASL-SHA256
   "a24f2e0774883aec6665133676f89c4391932141013582f897c730a3e6f52028")
  (:FILE "src/series/query.lisp" :SOURCE-SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/query.fasl"
   :FASL-SHA256
   "91565be9886afbff2f37bd8aeda43ce761a586de5e06f3b3788a952c437a1064")
  (:FILE "src/series/publication.lisp" :SOURCE-SHA256
   "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/publication.fasl"
   :FASL-SHA256
   "ec2659053fa223a064626f2945dcbcac6f91c2151f0855b55b9436297442b293")
  (:FILE "src/series/package.lisp" :SOURCE-SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/package.fasl"
   :FASL-SHA256
   "abb25745df6fc5015b3e04c0b1f54b7e3ba1b898a29dff06719a9bf92fd7daaa")
  (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/ownership.fasl"
   :FASL-SHA256
   "20307db024fb7a1c309d10c7b1e4f78440dcfcf9887ae5eae28eb8d4582e03f5")
  (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/io-events.fasl"
   :FASL-SHA256
   "a71af7095e86edc78b4fe5ea6ea4662ac0f82eaaf460bc9345297e5a0e42c543")
  (:FILE "src/series/events.lisp" :SOURCE-SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/series/events.fasl"
   :FASL-SHA256
   "b854b5441a7edce9012f252de5ed6f6bbda99cd76e77dad5fb628ab068574d88")
  (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/update.fasl"
   :FASL-SHA256
   "5844162b221c635e51d5324f5a106bca3170f799c1367f352038f90bb82208da")
  (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/types.fasl"
   :FASL-SHA256
   "5b68169174e33d78409c2aa6582c1186d1228ff7c20e2ba191870db773338a32")
  (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/read.fasl"
   :FASL-SHA256
   "5141909c8788667dfdaa3a446a06812acb83e4e589bdd167d48cfb932dbafad2")
  (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "380de4ce83a50383be83242745f307739ec4d3aa37f80279fc84255fea2a4059")
  (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/policy.fasl"
   :FASL-SHA256
   "c5c71be1d8e511e1988697dcae88f1bd0749dcd5f2ccaf0bda189f7b12ad4dcb")
  (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
   "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/package.fasl"
   :FASL-SHA256
   "544da5064e647ca82cbb68724d62659e75d28dbd133f13fbe763d1e4c9961ed8")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-worker.fasl"
   :FASL-SHA256
   "39049a7e3f4cedf3b9670ecba78345e884e4a8441b1f2238a8c67b1245c92479")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-update.fasl"
   :FASL-SHA256
   "ba3668831e7e29471bfd7e41ed54ed7547fecc22f556822c91c9f86bdae33acf")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-types.fasl"
   :FASL-SHA256
   "a57918e6edb61772e83a145dc13a8155000482b294181314b932293af897239e")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-read.fasl"
   :FASL-SHA256
   "c2260ee5e142f7f2e4394a383aacd0a5a9fd228391b08394866363879289042b")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/lifecycle-build.fasl"
   :FASL-SHA256
   "72cce0a954891c45b4b72b0186da4305cd03600076b6c1d0bbcf6d48ac004d27")
  (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/scheduler/build.fasl"
   :FASL-SHA256
   "282e9f629efa76d4a3a284be08552f3e934304918bdfa3f0f5771947c65f4176")
  (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/scan.fasl"
   :FASL-SHA256
   "e774dc0cc9232e2bb97a7e27c34f347e518bcf23bc5724b120aa250d2c16a010")
  (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/package.fasl"
   :FASL-SHA256
   "47753026a2c02df8c19332504b806fe10e5f3a4c2c73c5419de5ec4c22d0207e")
  (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-types.fasl"
   :FASL-SHA256
   "4835730ad0559b88af4743de7eb93c48aea06e11607072aa1c3624a57f5c125e")
  (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-query.fasl"
   :FASL-SHA256
   "cbe0ddc4260a094be67565d8db9bd8e30c0cc0c7f794f12e1d67c19a07e16887")
  (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-package.fasl"
   :FASL-SHA256
   "e7729f977296fa1dea0c7cb4349568201ceb4b33753189b731b9962c417340a1")
  (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-fold.fasl"
   :FASL-SHA256
   "620c89e86ad2a49638063731b0518e6c149e8e6e916c74fbafc45c4e57da19c4")
  (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-decode.fasl"
   :FASL-SHA256
   "1060e0db572de812010d5cabd256afbeb7a02ec08f956043d62d41bfe3a4f49a")
  (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/manifest-build.fasl"
   :FASL-SHA256
   "1d05e2621d33ce7c73bfc82325c70f3590c9a13e72320b8781b9f0853b4a7b15")
  (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-types.fasl"
   :FASL-SHA256
   "ee8124db3a22d00ec708b69a59b7db785c17da8faf530a212bfb161456ac8976")
  (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-query.fasl"
   :FASL-SHA256
   "5e8d7d189ed9a08d3be35d9cf49056c736fb060aaeb2fe7093f063cc47fe9b82")
  (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/inventory-build.fasl"
   :FASL-SHA256
   "b337b900d01bb2baf8c27ff161ca19f517ce335aaf6f368c9ef45b873c970c4a")
  (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-types.fasl"
   :FASL-SHA256
   "428a7a7350ca71e3f352c4f22784a0c98fe4792e45d7d680dec5df15d068af2a")
  (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-sort.fasl"
   :FASL-SHA256
   "0b3ed30b41b5fc873f7f1b8b66badeee5fb4c198ffdc35557b95ed18069eeb44")
  (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "a998bc379d67c12a62afe1ae84610f663e7ec3ee67917f9ad34d68f5f71f3233")
  (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-query.fasl"
   :FASL-SHA256
   "f88c0e378afaf6280de1c76fe459d259c1afa6dbc86a0354bc06703078b1b6d6")
  (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-package.fasl"
   :FASL-SHA256
   "fbeec4cd01812b6254ea80f1568ae12950c9cb9eb55ece0f55230b09080cfecb")
  (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/recovery/decisions-build.fasl"
   :FASL-SHA256
   "8a171e4a36596a29b8a29670e491854d04d3efb2c6323d2a387e41ebb864c156")
  (:FILE "src/read/types.lisp" :SOURCE-SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/read/types.fasl"
   :FASL-SHA256
   "91700c9cc46e4819f9d3fe62852ecd62a3f80d283797389de38c9f661ee42b85")
  (:FILE "src/read/task.lisp" :SOURCE-SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/read/task.fasl"
   :FASL-SHA256
   "31678c23a9d9443ea10fe58de01e53f4985d5e76562630b1139bb890f371c7f0")
  (:FILE "src/read/package.lisp" :SOURCE-SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/read/package.fasl"
   :FASL-SHA256
   "f9ec251be6d155ef7801d76bef36f42270a80e9ca7268e26f3454e523e357c6b")
  (:FILE "src/read/core.lisp" :SOURCE-SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/read/core.fasl"
   :FASL-SHA256
   "f8d2a005f7595ad674953aa8019d850a8cc7a9e6a201f1fdb8f4f2221f88355c")
  (:FILE "src/package.lisp" :SOURCE-SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/package.fasl"
   :FASL-SHA256
   "0cf0653a2d1086001f5d59345534f6866ba9ba70f1ce5bd5dd67159e5629cdcd")
  (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/types.fasl"
   :FASL-SHA256
   "1d8e0dbc4db25c1e7319aa28e72c053403f95a5324772cb88eb8ef2e171e1b00")
  (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-types.fasl"
   :FASL-SHA256
   "c380a6f257caad2f87554acf6636111e50d4e3a45a60ae86625e15169673e6c2")
  (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-register.fasl"
   :FASL-SHA256
   "a384154b505368e4aa1cc73feff2ca2b4cd7037a20516eff5bf497bb75914b9d")
  (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-read.fasl"
   :FASL-SHA256
   "decbe82152176646840cf1abdfda93eb94835dcd3b8d1516dd025b60943f3a59")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-lifecycle.fasl"
   :FASL-SHA256
   "ee87c469ef0018197d87e0dde7a40a248603bd38138b3ca477e99ab719c7225b")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-csn.fasl"
   :FASL-SHA256
   "66218cccd36991cd6c0445f1c80821e0c0da73c5f0764190c71102607af7351f")
  (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/snapshots-core.fasl"
   :FASL-SHA256
   "f8bcf6180dfa69ad3b1f281afe60d7753c25096e0b9eee13a87878b544031117")
  (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/mvcc/package.fasl"
   :FASL-SHA256
   "3ca3a0a5e3107dab221af597a3304021d583109dcf4ba7892b3e7d3ac65c1a4a")
  (:FILE "src/io/types.lisp" :SOURCE-SHA256
   "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/types.fasl"
   :FASL-SHA256
   "556c0beaa96a16e3f40317e3fda2bd31efe54582fd0d8354540827557f5758ad")
  (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/transfer.fasl"
   :FASL-SHA256
   "29e14d82bede1b8b4ac45a676ebec5f852a6b34d158d3c880752fed011c1a4e9")
  (:FILE "src/io/rename.lisp" :SOURCE-SHA256
   "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/rename.fasl"
   :FASL-SHA256
   "674a0e1a00a60eca4157a7787539ad041a38ae830434898697da9fdd2a424e35")
  (:FILE "src/io/package.lisp" :SOURCE-SHA256
   "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/package.fasl"
   :FASL-SHA256
   "83d7f7056b738f063e1ce50e93fe31d360ec965bbb7422f353399fc9c68c8b68")
  (:FILE "src/io/native.lisp" :SOURCE-SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/native.fasl"
   :FASL-SHA256
   "bf7e593fc49f0e872e1b5d44700ca745c6a1d21c632a3a6605acb8dbec90302b")
  (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
   "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/native-namespace.fasl"
   :FASL-SHA256
   "03acf3027182cf57e7699642a3d6dcf33ab66a29f344585744db9b473eed1e5d")
  (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
   "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/namespace.fasl"
   :FASL-SHA256
   "782b6606ebce827451f902fd7cd3aea6b9c361fba38307ef47bada5002a969d7")
  (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
   "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/lifecycle.fasl"
   :FASL-SHA256
   "203807de31db4c19e6205791644f9abd04200f8b189c6461b230a11cf66ce962")
  (:FILE "src/io/identity.lisp" :SOURCE-SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/identity.fasl"
   :FASL-SHA256
   "46fa853c53b9ecc277b4456563c4e5a327cf205bafee964e0a7d326f1e650e80")
  (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/identity-types.fasl"
   :FASL-SHA256
   "37ca8f6af64d60b91bf7574ce22d5bdd3fd62387486ecdf98e38b5458820aa90")
  (:FILE "src/io/flush.lisp" :SOURCE-SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/io/flush.fasl"
   :FASL-SHA256
   "abd077f48b8c4909167e529d152bac619005db77f1f4816405f05df62dd4ff5a")
  (:FILE "src/index/write.lisp" :SOURCE-SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/write.fasl"
   :FASL-SHA256
   "71cf351d0d4fe81b4b11c416bc29ce13e453c23a9e572e974f6ee362bb9fef7e")
  (:FILE "src/index/validation.lisp" :SOURCE-SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/validation.fasl"
   :FASL-SHA256
   "d2616b166df89ec6aeff1668b9487e9d70b112674c521317696dfba7e1cd0883")
  (:FILE "src/index/types.lisp" :SOURCE-SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/types.fasl"
   :FASL-SHA256
   "2a23e5788efbaf5c4884b0187c5ea5971eea796f40e5f33a822199ae268dacd4")
  (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/relocate.fasl"
   :FASL-SHA256
   "67425791ccfbb7b8d7572c8d959ccf6337f067ae0a406cbef1b46e8ec1aaf83e")
  (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild.fasl"
   :FASL-SHA256
   "2fc570f276a897d924e984b54c98f67b7150a6bd4535f4c9185a0c02c3b2bc99")
  (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-scan.fasl"
   :FASL-SHA256
   "a38c99b678b3a7ba66bf2b3c24eb625d86ccb17421381ab89557357b3a2527c8")
  (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-copy.fasl"
   :FASL-SHA256
   "899b6d4aa55dab19c14a6d50d3e84e733d652b81b47efabdcd928850d85b4b85")
  (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/rebuild-budget.fasl"
   :FASL-SHA256
   "2bd9bc28013ce96ce21dd111ca1c5368540a71cac9c14f1451a8e028e88f4114")
  (:FILE "src/index/read.lisp" :SOURCE-SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/read.fasl"
   :FASL-SHA256
   "6b45e1f47db16131bab1a69f71cdb6c5e5c75e36bc458f5b5959366cdebf368a")
  (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-write.fasl"
   :FASL-SHA256
   "f534984d199fa6cd20c81bcd44b501e6189ce7a1f5d26e7c9cbff8cc8e3a423e")
  (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-types.fasl"
   :FASL-SHA256
   "79ecb8e9ea1613437d7b07b69f1d48a41d645d8037bf3279aa8081d918176bfa")
  (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-relocate.fasl"
   :FASL-SHA256
   "276f12398a975e684a55a230b7ef7943ef6681b35004c861744fe7498cb3ab44")
  (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-read.fasl"
   :FASL-SHA256
   "d562ca0f9ac8b33ed36a49f3cadfc005e03ad7377fce04429f216593d768ca31")
  (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-probe.fasl"
   :FASL-SHA256
   "7fe93e53db5842726ffa22046a4b03eb50da7c1e5fcdc0757b6389831a8a3d25")
  (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-package.fasl"
   :FASL-SHA256
   "6e4c058bcc34b5a63eb6ee670251679cebc0b54f2f6a780da4e65c45aa1b87e5")
  (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-directory.fasl"
   :FASL-SHA256
   "a1d38e567ca1d51399f4316aee826f809b317a12b8db5124fca8f8b263be4086")
  (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-core.fasl"
   :FASL-SHA256
   "a5c182fd40895636457667277cca7a7918a18181e261de7726bb72317100e953")
  (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-build.fasl"
   :FASL-SHA256
   "be2fef4d6861ac25de2353c0ffc1c7d7082b4952719eb1e2b51c1085f385d3de")
  (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/primary-arena.fasl"
   :FASL-SHA256
   "6d5f80f2813c2299d877dfc9e1b7b5ab773d4c26c86d6e61bf380bb69f4d2886")
  (:FILE "src/index/package.lisp" :SOURCE-SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/package.fasl"
   :FASL-SHA256
   "489ae1fa1e98d451fb8ce09f0e2b319131f8f2c37bd22d87f7f9674ab34beac5")
  (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/hash-seed.fasl"
   :FASL-SHA256
   "43f76b231cc85b3903fae5558aa3c2a49afe7c3fbe29cec39f1f50fe086a4a80")
  (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/hash-digests.fasl"
   :FASL-SHA256
   "07a38c29cf2591777f3c8108a58796bc38582fc2751ba910fc812996381e0bc8")
  (:FILE "src/index/core.lisp" :SOURCE-SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/index/core.fasl"
   :FASL-SHA256
   "989ea0ea71e8d7ec5bba2da6b93cf8f163561f19a8c0b3a0df5f535fbe32fb75")
  (:FILE "src/hash/package.lisp" :SOURCE-SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/package.fasl"
   :FASL-SHA256
   "f90abdb5d28d19f2a4811c08c237f697133ae1aa9684af27cfd327a829600836")
  (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/hash64.fasl"
   :FASL-SHA256
   "854b97887f27645854d9dff17b0f489772d689174e0ac40c1c98777762968804")
  (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/blocks.fasl"
   :FASL-SHA256
   "c98cc66af9700318ae9bc74c6285635c5ede328068564ae9bf7f64919bc03f79")
  (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/hash/arithmetic.fasl"
   :FASL-SHA256
   "df2c5df72505deabd7b0743ae32f33364b7d6ba2a0932ba14f4a0440033a254d")
  (:FILE "src/get/types.lisp" :SOURCE-SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/types.fasl"
   :FASL-SHA256
   "a773b63089ce1b449065372c9acc1e2061cb57da59597096ae1696e37b39ecb4")
  (:FILE "src/get/target.lisp" :SOURCE-SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/target.fasl"
   :FASL-SHA256
   "c2f26263732bcbce1003bf3c537b8bad5cf4c737614db8cf33792d358bbc0fc2")
  (:FILE "src/get/segment.lisp" :SOURCE-SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/segment.fasl"
   :FASL-SHA256
   "9409b521844197842f2296b9bf009db7c8b0de2562122cb77fb9489662cdd382")
  (:FILE "src/get/package.lisp" :SOURCE-SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/package.fasl"
   :FASL-SHA256
   "6b04e5491b14e392752ad6e3fdcf57dd123613bd5805cfc63f91befaea1e7843")
  (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/lookup.fasl"
   :FASL-SHA256
   "985afeb527a71519f42ae7d9669fbcebcb86df54cb4c020004af4d01c4e66bed")
  (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/lifecycle.fasl"
   :FASL-SHA256
   "4d46f0f1068a83b433afb59c162ebcde6c130ef3cd38404371b5fdd5bfea0581")
  (:FILE "src/get/build.lisp" :SOURCE-SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get/build.fasl"
   :FASL-SHA256
   "eeded091e71cc4df58a854831ad804743f5525bd211ac08339ef05005c41e41e")
  (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/types.fasl"
   :FASL-SHA256
   "19190ecea0702b846bcde8dfd87174a7775261c69b3d59a915d8abf91a383594")
  (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/sort.fasl"
   :FASL-SHA256
   "3b3b8d4c1fe8f43e8c81a977ac4d5fd8b3d067c45c202c02fdf41d8ae433be31")
  (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/scan.fasl"
   :FASL-SHA256
   "7225afeb6beeadd02acb138eca0cc769692ad01392123f8a6d96b8bb16d38f58")
  (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/rows.fasl"
   :FASL-SHA256
   "b0583397908e81d3e56496998341b185c365ae2b1e505785fc96c7113e4dbe58")
  (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/read.fasl"
   :FASL-SHA256
   "1be17f9cd64530916f1dcba47f812e86fe34acb14c0ab7d65ea46da7287e6487")
  (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/package.fasl"
   :FASL-SHA256
   "792c128c6accb88c943e3095e2d8c763574210f204d427dbcdf1e595d857e611")
  (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/build.fasl"
   :FASL-SHA256
   "bec041d23e175d084e48e7e792e3244ff0abff58a2aa07b5d3603c8a77c3547c")
  (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-types.fasl"
   :FASL-SHA256
   "126865ff4e219c5955da68139f9df5b005fd433bd793d6139c80857ea4034168")
  (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-scan.fasl"
   :FASL-SHA256
   "d1f81c0cba433a14222454d018f13eead156696cb3603dd2068f3fe365a1f588")
  (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-read.fasl"
   :FASL-SHA256
   "18eb71fffd0e7a58e62e84b1a2b846e64d45063527f1e83eaa173ad5b1c2b8a4")
  (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-preflight.fasl"
   :FASL-SHA256
   "a201cb3551a2fa749e4032040f135d7a19549f150292d4431d39322bfde31164")
  (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
   "a27a7618216170e66b57113239ac60e8f1cccd8cf5d526e1b94e88894b3fb9f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-init.fasl"
   :FASL-SHA256
   "54ff5fa2fffc5a4a6e915ae6708a59cd3593981e7fa69b4c278fdd2b32a4ed02")
  (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-directory.fasl"
   :FASL-SHA256
   "1e1fee12ee77632633c7c308cf93c56b4864d3438b3f1299a33e4ddb1ddb29b2")
  (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-resolver/active-build.fasl"
   :FASL-SHA256
   "2a701f030af2094d9b6530738a77451e630de6db8195550463bb27c6c0907384")
  (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/types.fasl"
   :FASL-SHA256
   "61e75f76d7849ed16b63548c7b459229d64302db2d4d8385f487d0970d3bb62f")
  (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/sources-types.fasl"
   :FASL-SHA256
   "a79b9f6bb2debd059e382b9d0ffadb74d5d485cd66a49f0dbc0277f8d5bbfadf")
  (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/sources-read.fasl"
   :FASL-SHA256
   "8867f9fa01fa141142ad1fe1855c3dddc45045cdb92414443175a808ead4aa33")
  (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/read.fasl"
   :FASL-SHA256
   "fc8c35dc599c20be8075f0f870542df7b7709fc71b7b039bc5c9f0665917407b")
  (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/package.fasl"
   :FASL-SHA256
   "01e4a6c0b79f9b67eca2a760cedec143d0ae98beacd1de1090f500fdb9382a7a")
  (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/get-directory/build.fasl"
   :FASL-SHA256
   "ce4700655f75381c28969569046525965b382ee3525d72da1e47d40b48ea6af5")
  (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/record.fasl"
   :FASL-SHA256
   "46fdf0bb83eede12d739b410f12b896396b0c250c88dd86f900e34f8b2cd8674")
  (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/package.fasl"
   :FASL-SHA256
   "adabe4a1b66cbbc3b4657f2141ce3c9345c41e874c7c2115080185e8ed881d43")
  (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/crc32c.fasl"
   :FASL-SHA256
   "2cddb1bfd709ec89bdbaaa5d5f4e1d07c552b9811d4f398434dc4b652b2d243e")
  (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/conditions.fasl"
   :FASL-SHA256
   "f5f8cba5714f339e49fba5b8c9f09e25f7a52ab127d6222d06b737c82cd6d7c9")
  (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/binary.fasl"
   :FASL-SHA256
   "71cab74be1bdebac6d12fe5c5da44920b4e5adc3d9f165233c1f2dffa2b3520c")
  (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/foundation/batch.fasl"
   :FASL-SHA256
   "9440540f4e6eac1c22dac48598f9b60c84940f68ad9d77d89f7158ef28bc8e97")
  (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/writer.fasl"
   :FASL-SHA256
   "c8b235a5ba1741a8ae85b477f90bdcaca7d24f3b773a5b69b2e9daeebb5e9712")
  (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-types.fasl"
   :FASL-SHA256
   "d52a078ff6cee0ae506fc869bd53ce01aed1ee52bcbd0e9343a1361322e68a1e")
  (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-run.fasl"
   :FASL-SHA256
   "f40e90a610347291a934d293e7c2b8fac0b166abf901e112d4e3a607c92ec11b")
  (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-claim.fasl"
   :FASL-SHA256
   "1af09771dc09aa8e6428b5e7da6d4641841988125bd715240fdb1788134ae907")
  (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/worker-boundary.fasl"
   :FASL-SHA256
   "78c3fbc8038580d6f9eae9e5be87b4cf8790b7f4597a7b4ee059ada096709481")
  (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready.fasl"
   :FASL-SHA256
   "31e83ad1def13ef36ded8164c33afcc7a5327552db6dc87ab2a1d2e1ca06d859")
  (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready-types.fasl"
   :FASL-SHA256
   "b2916b4cc0c47b65192f7bf9bb6db8b6ff92d8377221017fb81c5648f2305389")
  (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/ready-recycle.fasl"
   :FASL-SHA256
   "bb19e1092a736d85499979c315f965884a27c29eb1aaf9c3677694fc3930c22a")
  (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/queue.fasl"
   :FASL-SHA256
   "cfc1f0a9fb8460ec1cfbc867e48aea7aabd22565979607acb91a7f1d778120be")
  (:FILE "src/execution/package.lisp" :SOURCE-SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/package.fasl"
   :FASL-SHA256
   "1993e5c7125c3b55928ee4deddf91baba09d8b254f4ef08727e48550727034be")
  (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/execution/handoff.fasl"
   :FASL-SHA256
   "cf6a57ca8c87db4e30f84450a13b60b01a7e9f49b4855984f0e805ea64c8fc17")
  (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/types.fasl"
   :FASL-SHA256
   "706221b071739a3464f89e521cea61ed74d6902d41cb44fec52b20b4b6b7dd74")
  (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/retire.fasl"
   :FASL-SHA256
   "28213cb7af0267fb2b1736211c85b48643e527d91635ff0d891865d36e8551b7")
  (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/reclaim.fasl"
   :FASL-SHA256
   "ed2205620d6237f2af3ca39c385467b88295caec33639a4b5727778b13d00b7a")
  (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/read.fasl"
   :FASL-SHA256
   "b82a1ec80300b6ae6b7b75360ff69bbc9f26decb2facecd3ab5487634f5392ee")
  (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/package.fasl"
   :FASL-SHA256
   "faaf3783011fc4a90c8b5a75957fcf7657d3b3fdeaf54d16d4939e511ba2c31d")
  (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/epochs/core.fasl"
   :FASL-SHA256
   "991c13c8f7eb8e5274fb9bfcdf98b268d8764fa45c3a485513621e193147fd47")
  (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/dispatch/types.fasl"
   :FASL-SHA256
   "ff32cb879d4a497081d503775d32d8c3c6779dfdea7c2c298241556d64ddc6ae")
  (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
   "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/dispatch/package.fasl"
   :FASL-SHA256
   "9a3adeec53d3988529bde58add126d825c36de207c44f0b8394ffe2deaf34b5d")
  (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/dispatch/claim.fasl"
   :FASL-SHA256
   "0014d99b0b32247acce4524b74eb6c996f3c26f7b6fe46501db792d41dccc224")
  (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/dispatch/build.fasl"
   :FASL-SHA256
   "34ae28a636f6f308af027b7d17a305df7019df8024c2ee79e16ccc98f3efa954")
  (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/csn/registry.fasl"
   :FASL-SHA256
   "45998815390a36d96fa6bf6f9ee3196525741ac67473d95884e7d9cd1dbb3598")
  (:FILE "src/csn/package.lisp" :SOURCE-SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/csn/package.fasl"
   :FASL-SHA256
   "c6716432067d889da1f77224f9e3d2df07f5ba19c4de285c952d255639429945")
  (:FILE "src/control/types.lisp" :SOURCE-SHA256
   "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/types.fasl"
   :FASL-SHA256
   "6911db1536ebab373ec8c09cc34d638bf4c83fa543109360f7e615850536eff1")
  (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/transfer.fasl"
   :FASL-SHA256
   "e3f5e986dde30fbb7427411ac37c0b045e1690890b89eb1edb585f19dba0a6c0")
  (:FILE "src/control/publication.lisp" :SOURCE-SHA256
   "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/publication.fasl"
   :FASL-SHA256
   "43bc3365aabae87bd830b83d060a439156d860eaced51867f5bbb637c3e6bb1c")
  (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
   "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/publication-read.fasl"
   :FASL-SHA256
   "f42dbbb18393d30f24149f779ebc49f9948aff9f44e75e7d64ade4a76621526e")
  (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
   "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/prepare.fasl"
   :FASL-SHA256
   "5a661a0ceef7f1d5097a05c521ca0077879526c0a6a3329f405511792ddbd8e8")
  (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/preflight.fasl"
   :FASL-SHA256
   "c37a17e1622f709d0caea991636e4c5fee171e2b3d336eab56504e2268f54a62")
  (:FILE "src/control/package.lisp" :SOURCE-SHA256
   "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/package.fasl"
   :FASL-SHA256
   "a1be625baae70d029387c6e1bd69c9dd68d417078191590114343537c0cf436d")
  (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/dependency.fasl"
   :FASL-SHA256
   "a2d2c633ed898930779f19ef4505ad75641613174b0b85b8d318270c6515b514")
  (:FILE "src/control/build.lisp" :SOURCE-SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/control/build.fasl"
   :FASL-SHA256
   "bd45c813bab2c52f951b37519dc7978137e6b07d61d81cec08b28a5a80454d5b")
  (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/utf8.fasl"
   :FASL-SHA256
   "1ccc74679bd1f6b4fec96c42b30e0caba9887e9f451cbb8d6df460e01b9482e0")
  (:FILE "src/codec/package.lisp" :SOURCE-SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/package.fasl"
   :FASL-SHA256
   "58b47c3fe4a06e1147db8ac3eb9c58c4601874e4d09dd7f4ecc8800386590339")
  (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-write.fasl"
   :FASL-SHA256
   "a984e50b06519743b28ce6b15269c28a08e44c78047764515b107a05074adc9d")
  (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "61471a677701449d40b8e81809af4722c02a16b365494bd6e21cadc987802e8b")
  (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-space.fasl"
   :FASL-SHA256
   "ac4ada3d856eefa2322c628bf68b9dae6a42b2ccf9a9075d4dffca16ee8bac71")
  (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "c0c073919e5cb86f1c36c161faa76a3215e0317ea7fa5a2af57fec8ca72948b1")
  (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan.fasl"
   :FASL-SHA256
   "53dab6a4981f521aa996f6daaac8f210bb6304368844fd76fcb4c2662ba04959")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-stack.fasl"
   :FASL-SHA256
   "39e1e23b362677e7563175827e53c3a5af5464deb97c6282ee383bf809bfb039")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-minimal.fasl"
   :FASL-SHA256
   "ede1f98b6959dbbefe51e1e5339cec0eacf1c88f69b9fe3fe38410f76ba29758")
  (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-items.fasl"
   :FASL-SHA256
   "08f09a96fe4249c4199e3c9d22f79996ca964b9414d8244f1d373a9e4e7ad9ac")
  (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-scan-input.fasl"
   :FASL-SHA256
   "3f3b74635bfd12fa7cb35e8b1d2c41de55d7a85b32ac6db7fb465f08f2b30b35")
  (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
   "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-package.fasl"
   :FASL-SHA256
   "c6c18cac6bc5dbc2fa3bc596922bee3afb8fc100f184500714ab06e42e2d9f39")
  (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "156da31e08a1d3c182293dc82b356705455368f682e063d908f91f93e01d8e02")
  (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-header.fasl"
   :FASL-SHA256
   "472cb2e9115cc03ddc9a925c1f3b40527ac3c810504294cc2a8f8a83a56cb87a")
  (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "200b7f124b397fd4f55149a30ffcf4d0239428431378282029587f45b0c5815e")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-narrow.fasl"
   :FASL-SHA256
   "def401ab8ec387d563250ec04232f242ca058dbc7d3de4e0f31bacd200a3091d")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-float-minimal.fasl"
   :FASL-SHA256
   "2a607040696d3f7840ac1a0d2b4e8b025b5bcdfdb61e84d7b1c8511ed73e73f0")
  (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "509e4f7fce88289cab363c0322f13adb0c44443957c4cef6eefa663efd8bbfd6")
  (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/codec/cbor-array-input.fasl"
   :FASL-SHA256
   "b6d4b2157ab8ba33cc12c1da006b191babeb208777d728ad7f9ce2d36d804d47")
  (:FILE "src/cache/write.lisp" :SOURCE-SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/write.fasl"
   :FASL-SHA256
   "82c357f88ef64ec072f0edd6052c8a3a8e36f9dc202201fc471069e6d4e483a2")
  (:FILE "src/cache/types.lisp" :SOURCE-SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/types.fasl"
   :FASL-SHA256
   "0162f108f1f1c767298d726d39eca7efcda7267644fb0b3a04aa476bea1dea8f")
  (:FILE "src/cache/read.lisp" :SOURCE-SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/read.fasl"
   :FASL-SHA256
   "7d6342577f9bb136f03eca63fd2e92872abdfbcc43cc4e5a9c18c4276190f93b")
  (:FILE "src/cache/package.lisp" :SOURCE-SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/package.fasl"
   :FASL-SHA256
   "22c62c0d6f814ec60c3723435e116034c6a0267e4c208725adf6f0a9088b8ac2")
  (:FILE "src/cache/core.lisp" :SOURCE-SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/core.fasl"
   :FASL-SHA256
   "c209c6ffbf07576467c922270e6013dd49dd2f9912b4528421c2115a8fdfe305")
  (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/clock.fasl"
   :FASL-SHA256
   "fd90b8ea991ff57ed661c68213ddc14d8943a178a3c5c5dd1760c54509c2d6c3")
  (:FILE "src/cache/build.lisp" :SOURCE-SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/cache/build.fasl"
   :FASL-SHA256
   "6b9214b617f7963f81766ba4bcb7a6b062c4d3fd88cdd1a1a33ab7ac88645028")
  (:FILE "src/active/types.lisp" :SOURCE-SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/active/types.fasl"
   :FASL-SHA256
   "b77362c1006a4bb952b1404cc6fee10929d64d188717a6ef71432170ebe13f5c")
  (:FILE "src/active/source.lisp" :SOURCE-SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/active/source.fasl"
   :FASL-SHA256
   "cb141e3bb00b67fa7dcc7dd03c8420c0de1426dcf9109f0eac15854f0ce38e0b")
  (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/active/prepare.fasl"
   :FASL-SHA256
   "4a4c2e2e26a29e1b77ec37e1c79f48aee5575b0458e801589450437def9c354f")
  (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/active/preflight.fasl"
   :FASL-SHA256
   "51bbc0be3992354c5414b96f7aa9d2cc62094e0ca6ada448f0f865a98d98c031")
  (:FILE "src/active/package.lisp" :SOURCE-SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-bootstrap-mutations-R1/raw/isolatedtests/ignore-readonly-open/fasl/src/active/package.fasl"
   :FASL-SHA256
   "0e027873f6ee3713e444cb6edbf5e111637f66b85589b9c961cd274237ae904a"))
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
 "08e806c05beff12477c29aa2f4b7ad3975c37013b983230b6fb4adf3ac51f8a2"
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
