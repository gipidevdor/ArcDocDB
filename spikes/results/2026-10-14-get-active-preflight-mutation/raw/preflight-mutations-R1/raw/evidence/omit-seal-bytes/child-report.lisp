(:FINISHED-AT-UNIVERSAL-TIME 4000985409 :CONFIG-SHA256-AFTER
 "b82c3f88ccfaa2740ad723d84138ef92a71181b31284b1f6280964bb8d6c77c4"
 :CONDITION-TYPE "SIMPLE-ERROR" :DIAGNOSTIC
 "Asserzione fallita: (TYPEP ARCDOCDB.GET.ACTIVE.TESTS::CAUGHT TYPE)"
 :CONDITION-REASON NIL :CONDITION-NAME "SIMPLE-ERROR" :CONDITION-PACKAGE
 "COMMON-LISP" :EXECUTED-TESTS
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY"))
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
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/support.fasl"
   :FASL-SHA256
   "1bca64e5e3c1a4fcd57d3768fe5e7eb37e1664bf822f2cc4b2aeb8f191301814")
  (:FILE "tests/wal/native.lisp" :SOURCE-SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/native.fasl"
   :FASL-SHA256
   "3cb1008f95ecf11c86c9728f425031bc9c7b38a6be03406dcd7cdbf0b288fb8c")
  (:FILE "tests/wal/group.lisp" :SOURCE-SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/group.fasl"
   :FASL-SHA256
   "a72fc8b762c4eacdf989648c7b4b21a1921a308904c14db6ca02aa21542893ed")
  (:FILE "tests/wal/fault.lisp" :SOURCE-SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/fault.fasl"
   :FASL-SHA256
   "4a5555845e271c780ac0c054dea30cc3a60ff83cd0691d91a85f4df929a8bb03")
  (:FILE "tests/wal/csn.lisp" :SOURCE-SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/csn.fasl"
   :FASL-SHA256
   "a99ecf43ca8eea00de1328340c5c5d3d45aa5fe7f9680cf8ea6cd2196abd0f64")
  (:FILE "tests/wal/csn-threads.lisp" :SOURCE-SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/csn-threads.fasl"
   :FASL-SHA256
   "300f6f60741b2b916c2a5e2da5b8632866fb76241ee8cf01316967e6a1eaf743")
  (:FILE "tests/wal/builder.lisp" :SOURCE-SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/wal/builder.fasl"
   :FASL-SHA256
   "2c6a79c68c778aeb158b0ceaa2d898869fcf46b1cb08e96726effb71c1e47e5e")
  (:FILE "tests/storage/support.lisp" :SOURCE-SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/storage/support.fasl"
   :FASL-SHA256
   "5a571e9e984314f91d5dc8a57bf3a2cd065d6299c6bacd65bdc84e4e7eff701f")
  (:FILE "tests/storage/segment-header.lisp" :SOURCE-SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/storage/segment-header.fasl"
   :FASL-SHA256
   "92510fed1073f9949ea6a59d3c3c3577bc4f651b633da24e84c13cbf6e70dd4b")
  (:FILE "tests/storage/log-header.lisp" :SOURCE-SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/storage/log-header.fasl"
   :FASL-SHA256
   "35412756b6d327240b882961b9bf6c488c71adb00dfcf50b42d0a894ffdd0880")
  (:FILE "tests/storage/control-payload.lisp" :SOURCE-SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/storage/control-payload.fasl"
   :FASL-SHA256
   "7b84ea556524811efc404640a290c5bf298020a58828277f0fd425476d8d5672")
  (:FILE "tests/storage/compaction-scan.lisp" :SOURCE-SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/storage/compaction-scan.fasl"
   :FASL-SHA256
   "efe3f4584fa1fb6931c1071a279c8377d970d6963a9f954143367592df53c178")
  (:FILE "tests/smoke.lisp" :SOURCE-SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/smoke.fasl"
   :FASL-SHA256
   "80a6a68ad9a43413cd7cf3bebeba854fc769d9d5353d0ab0cac89c21230b8fdd")
  (:FILE "tests/series/worker-routing.lisp" :SOURCE-SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/worker-routing.fasl"
   :FASL-SHA256
   "958050d35750b4101253e8fd791258ffa19bd2850e5678b7770b8dc23737832e")
  (:FILE "tests/series/worker-bridge.lisp" :SOURCE-SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/worker-bridge.fasl"
   :FASL-SHA256
   "d174b10d648308edb1a23c14fc66699ab45da0b8732125d9278e971405f46010")
  (:FILE "tests/series/threads.lisp" :SOURCE-SHA256
   "b8fe9d7e1c0ca4e18909a0a6f7ac03c8df68dd186fa21e62600be685d6e4c7ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/threads.fasl"
   :FASL-SHA256
   "18b1ef5772e911b17440d780c67942b744b92ff43a4718d64c1fbe1b2bf9e356")
  (:FILE "tests/series/support.lisp" :SOURCE-SHA256
   "810dd8a69927c75e3399af47b8fff18e4ab88eb41049c50bafee5c041be263b3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/support.fasl"
   :FASL-SHA256
   "71f6e917f80bd02f3d616abb1437942aa55da97b7dbbf6a657d26b7e1ff9feb3")
  (:FILE "tests/series/controller.lisp" :SOURCE-SHA256
   "8bc98ec62e58803cab5613210e1200e0ce296af9aff63b5dff61579c3931670a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/controller.fasl"
   :FASL-SHA256
   "bbb923e20c15b2fbe20c0ce2357950d54b7621c9cc50b93b8688feeec4c727b4")
  (:FILE "tests/series/boundaries.lisp" :SOURCE-SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/series/boundaries.fasl"
   :FASL-SHA256
   "3b3fc76d0ce84a7f73189693c1c8bbe884190905d9fea2ede1cd8f41a67592f9")
  (:FILE "tests/scheduler/support.lisp" :SOURCE-SHA256
   "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/scheduler/support.fasl"
   :FASL-SHA256
   "44b35d85b205d56db883867ec5f8f805ebe35e5ab02b34f45630173450a5a426")
  (:FILE "tests/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "6a04ff35048b733b212c794d9f828e74f7dcd2c73070564dbb91b9e2fd5c12ec")
  (:FILE "tests/scheduler/lifecycle.lisp" :SOURCE-SHA256
   "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/scheduler/lifecycle.fasl"
   :FASL-SHA256
   "61a49e04e1ba8972aa79cb5a56e23b837c65611e3a81f610d9594339946aa424")
  (:FILE "tests/scheduler/dispatch.lisp" :SOURCE-SHA256
   "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/scheduler/dispatch.fasl"
   :FASL-SHA256
   "93f4261b2523c534eb0d62113ed2a894f7f05d2a11a82607f6ad59ce4b9483fb")
  (:FILE "tests/scheduler/controller.lisp" :SOURCE-SHA256
   "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/scheduler/controller.fasl"
   :FASL-SHA256
   "d3d7582ff545d1c8828fb17f6f35a7145bca7d33a41cc2b027a20b5cf5776cb7")
  (:FILE "tests/recovery/support.lisp" :SOURCE-SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/support.fasl"
   :FASL-SHA256
   "a9c20ec1c78dab97cab14c00665cfc0404a7e1162525b8bf08fbdd4713da6065")
  (:FILE "tests/recovery/scan.lisp" :SOURCE-SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/scan.fasl"
   :FASL-SHA256
   "91b769bf8e6ac86b741e3d1e964c488a344df0e98a9ec13780b3f57e7b94cf7e")
  (:FILE "tests/recovery/manifest.lisp" :SOURCE-SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/manifest.fasl"
   :FASL-SHA256
   "d5fa98a0bd58112d0070641b138df3a26a452f39c235ce04fc82a0265a220464")
  (:FILE "tests/recovery/manifest-support.lisp" :SOURCE-SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/manifest-support.fasl"
   :FASL-SHA256
   "499d4bca0f0ddc171cba13b1a36714cf2c600b20b34b39ed9795ac7f45a2074e")
  (:FILE "tests/recovery/manifest-audit.lisp" :SOURCE-SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/manifest-audit.fasl"
   :FASL-SHA256
   "2949189651b5ee475fe97d9243016448d7ec1b812d94e56d66e321f29ae2dcd0")
  (:FILE "tests/recovery/inventory.lisp" :SOURCE-SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/inventory.fasl"
   :FASL-SHA256
   "702a0ff86aa6623be5da23ad490682acf4da848dc4f7cc1612587455393e05a0")
  (:FILE "tests/recovery/inventory-support.lisp" :SOURCE-SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/inventory-support.fasl"
   :FASL-SHA256
   "8704751c36552fc080ed37597b72c2ee1937c42235d0c578a377919de5e7d312")
  (:FILE "tests/recovery/decisions.lisp" :SOURCE-SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/decisions.fasl"
   :FASL-SHA256
   "dd2bae1e80737565227f2846fdfaeee86aa06ab63bd5fa2965d8a660de44c8c3")
  (:FILE "tests/recovery/decisions-support.lisp" :SOURCE-SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/decisions-support.fasl"
   :FASL-SHA256
   "825134a352cbdf940a10b87b2739238458797b464e7f4ff29b8e34353b4a2e80")
  (:FILE "tests/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "0ff85720df7996fef1fe84dbe87dd46aade126e3ef1b2d22416c6e7ab69ce70a")
  (:FILE "tests/recovery/decisions-audit.lisp" :SOURCE-SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/decisions-audit.fasl"
   :FASL-SHA256
   "6a3c85f26d68060916b803e5327b8b8b57962800381d578144c16c8edc6c8cb2")
  (:FILE "tests/recovery/corruption.lisp" :SOURCE-SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/recovery/corruption.fasl"
   :FASL-SHA256
   "de0350fb37d8bb7481fdb38f59e3fedad42e6eff1d68ea34a70b381c2a043c8f")
  (:FILE "tests/read/threads.lisp" :SOURCE-SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/read/threads.fasl"
   :FASL-SHA256
   "74ed8e73017ae775abca81fe79b34ed79de360417c35ff6dded37f7b355af904")
  (:FILE "tests/read/support.lisp" :SOURCE-SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/read/support.fasl"
   :FASL-SHA256
   "926150a9d61a15f95b5461ef18d3d0dada5fc91ff0f013b5c83bb07c76b89021")
  (:FILE "tests/read/lifecycle.lisp" :SOURCE-SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/read/lifecycle.fasl"
   :FASL-SHA256
   "b890f1bd6a66c6d6861b7f6c90c2fa9bad78f0a9eac1e5939a9b9cecb0effc06")
  (:FILE "tests/mvcc/support.lisp" :SOURCE-SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/mvcc/support.fasl"
   :FASL-SHA256
   "648c085f27f367e5040ba830af9c80b7d5c3a9c26310d8eea60af35dfbd14877")
  (:FILE "tests/mvcc/lifecycle.lisp" :SOURCE-SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/mvcc/lifecycle.fasl"
   :FASL-SHA256
   "577ae4044ecfe394d3b7faf15f422cf3481406a376c4bfae531ff93602e9e996")
  (:FILE "tests/mvcc/capture.lisp" :SOURCE-SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/mvcc/capture.fasl"
   :FASL-SHA256
   "03911a3530e8cce916a0287bebf34e1f937f1fca4a55ad17b63ff940049d790f")
  (:FILE "tests/io/transfer.lisp" :SOURCE-SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/io/transfer.fasl"
   :FASL-SHA256
   "51b819766f35436b8636b8e224433c5f886f1e1789a83e47c97f4b1a3f542b6e")
  (:FILE "tests/io/support.lisp" :SOURCE-SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/io/support.fasl"
   :FASL-SHA256
   "1f88fde97a3fe8ec8eaf1c8c68000c74aafacf21acba802161a4a699a6135a79")
  (:FILE "tests/io/rename.lisp" :SOURCE-SHA256
   "cd14164b36977d927f7e4cf4d70d2068661c47f538228957102a4347a853fa59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/io/rename.fasl"
   :FASL-SHA256
   "919e15bd00a24ba15cd992896365b3de65ffaa4aa98190f00991b6dbd1cee6f8")
  (:FILE "tests/io/rename-native.lisp" :SOURCE-SHA256
   "b1f43b09af8f4253ce22a4793f9267c7d60df69339a3fc51b9fd83b6a331bce5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/io/rename-native.fasl"
   :FASL-SHA256
   "580687b762ed9fe8b8d70f18894cec51e1e0e1bc4e4d110e3dfae8236d06de5e")
  (:FILE "tests/io/native.lisp" :SOURCE-SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/io/native.fasl"
   :FASL-SHA256
   "ad2324b3d62e702a70db14679f7aa31d14e2191d6839dc490c39dc8e711176ee")
  (:FILE "tests/index/slots.lisp" :SOURCE-SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/slots.fasl"
   :FASL-SHA256
   "918621f8bd4fbccdabded4520204cdfa53419221f0cd89d634c70ec9cb9ddbea")
  (:FILE "tests/index/slot-threads.lisp" :SOURCE-SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/slot-threads.fasl"
   :FASL-SHA256
   "35af0f54b2b75f276c74a21dfe4e98c592dfa388b05ceb830f1fa4f24210e626")
  (:FILE "tests/index/slot-support.lisp" :SOURCE-SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/slot-support.fasl"
   :FASL-SHA256
   "675a3d77914fff532e7cee178d1fdb7ec7071a4531385f91e6e7823137559e6f")
  (:FILE "tests/index/rebuild.lisp" :SOURCE-SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/rebuild.fasl"
   :FASL-SHA256
   "9728eb501fab5c22e94804408f195aa855e37b3b6c8f4388ed2601ebd03c1dab")
  (:FILE "tests/index/primary.lisp" :SOURCE-SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/primary.fasl"
   :FASL-SHA256
   "d49eed443d215556ebf9886f03c5f92aad96dc7da83e551acb733b09dbabbaab")
  (:FILE "tests/index/primary-threads.lisp" :SOURCE-SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/primary-threads.fasl"
   :FASL-SHA256
   "916d13f998441c2daddef2b79e62e3feccd086ce6ed7c4e33fb34dce99fe1a98")
  (:FILE "tests/index/primary-support.lisp" :SOURCE-SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/primary-support.fasl"
   :FASL-SHA256
   "ef7dd1adef47d7797454555c399cca559734ceac2bfbbca5edee702782947d35")
  (:FILE "tests/index/hash-digests.lisp" :SOURCE-SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/index/hash-digests.fasl"
   :FASL-SHA256
   "02d3fda2ef7594eb31beb9bb829e575fa7bc677381ba46254fce8d3d1214e811")
  (:FILE "tests/hash/threads.lisp" :SOURCE-SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/hash/threads.fasl"
   :FASL-SHA256
   "853ac204accbad142eedeedaec1a90ee95fad56731939c4329ce6c7b907e2885")
  (:FILE "tests/hash/support.lisp" :SOURCE-SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/hash/support.fasl"
   :FASL-SHA256
   "4c051c035dea823b341944b48941aa1300c8ac6e5245fe960b75f66699f143dd")
  (:FILE "tests/hash/hash64.lisp" :SOURCE-SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/hash/hash64.fasl"
   :FASL-SHA256
   "a4310a1abddfa6f3c00ee807707b70087745726232f36b5624d1c659ece647dd")
  (:FILE "tests/hash/guards.lisp" :SOURCE-SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/hash/guards.fasl"
   :FASL-SHA256
   "24d0cda6538494f28a233d123f6114fdb8743165c534c92419f73e26d79be966")
  (:FILE "tests/get/support.lisp" :SOURCE-SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get/support.fasl"
   :FASL-SHA256
   "959893f6232a394e06ff5922fc06895bb335977ef5aed0f8bedd21b7fa788adc")
  (:FILE "tests/get/segment.lisp" :SOURCE-SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get/segment.fasl"
   :FASL-SHA256
   "8ee0316b599f2f188de04e64f8dcd3ca002b8db1eb65eb0a1a7fdf920b0d62bf")
  (:FILE "tests/get/lifecycle.lisp" :SOURCE-SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get/lifecycle.fasl"
   :FASL-SHA256
   "81b4b31f75b7a61ec33ab838cc2a1b396587ea0687a482800558e3af87c28adf")
  (:FILE "tests/get-resolver/support.lisp" :SOURCE-SHA256
   "d30a5c8a61b63e339facfee9f7701eb5a3614bbfd1ebef2c46c747d136640f8b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-resolver/support.fasl"
   :FASL-SHA256
   "ed27bb77a829fda32620ce68ff36a813deaf4ebfd9cc08f0787cdaf4ed9ac7e3")
  (:FILE "tests/get-resolver/sort.lisp" :SOURCE-SHA256
   "fd7f97f0fad2e970b972688481c0c132f11c85f5fdcd0f02bee6b0b3f93b97ae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-resolver/sort.fasl"
   :FASL-SHA256
   "153e7387cd767cb70b0caf3aeef5a6c28b3abdbb29507cb4206deb9d23d1dad1")
  (:FILE "tests/get-resolver/read.lisp" :SOURCE-SHA256
   "70e46d1b88716f44309f46b4955928ca7fa2195edd80bb67d5b97732b971e8fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-resolver/read.fasl"
   :FASL-SHA256
   "7d36d54d671bb8f710f5ef7ab55683118c4fe4e1ae56e62b3b5e0edbe776aa4f")
  (:FILE "tests/get-resolver/construction.lisp" :SOURCE-SHA256
   "45cbef3b35db35d60a4cec2516c24f6ef56f5edb2f19f6f07f24fe00c8737b13" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-resolver/construction.fasl"
   :FASL-SHA256
   "00158779dd208c79d697f312416eb7e343987723f095ca35b6e21c8dc5555ee8")
  (:FILE "tests/get-performance/threads.lisp" :SOURCE-SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-performance/threads.fasl"
   :FASL-SHA256
   "3540c4d8f18cb50989d93e56212ded1925d67f32a7062754a3774a59c0598ce1")
  (:FILE "tests/get-performance/support.lisp" :SOURCE-SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-performance/support.fasl"
   :FASL-SHA256
   "5759f84c82e551bbd110b44078e880fb8fdcba93e881f5c9c2c21e689562fabf")
  (:FILE "tests/get-performance/paths.lisp" :SOURCE-SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-performance/paths.fasl"
   :FASL-SHA256
   "d137e17e4ea9e6255c95181855fc7810097f1d9bd62f68fbce2c5bfb4e902e7d")
  (:FILE "tests/get-performance/guards.lisp" :SOURCE-SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-performance/guards.fasl"
   :FASL-SHA256
   "a6897fbc379064cd7c19f1fc2c56bbd7002f4d8605cfca7311d33ef69f9f8c4f")
  (:FILE "tests/get-directory/threads.lisp" :SOURCE-SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/threads.fasl"
   :FASL-SHA256
   "dfcff85f9507efb31de41a7e92968b54270a586862d12777808333b806a30921")
  (:FILE "tests/get-directory/support.lisp" :SOURCE-SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/support.fasl"
   :FASL-SHA256
   "df49bb5c1307901c01e5323724189de596c8ac1f9ceb646e90215bc9f4bf7f99")
  (:FILE "tests/get-directory/series-support.lisp" :SOURCE-SHA256
   "40f15fbdf42b80515cbfc57eb74bedcbd96d4a9e7e19dc25d8db59f326fe659a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/series-support.fasl"
   :FASL-SHA256
   "21666e8234ba7fd469d664d32bf472e51d7b122cb03d6ee516d4780eb9b526b8")
  (:FILE "tests/get-directory/series-read.lisp" :SOURCE-SHA256
   "4b9856d69cd82c1462c87d16b9eb8e00fb642a46bb22f2f7b01865f7cc2a83a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/series-read.fasl"
   :FASL-SHA256
   "8206afe5407e3b691768432740f841e1e341a895a73879ad190f7c6685e4ecd0")
  (:FILE "tests/get-directory/read.lisp" :SOURCE-SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/read.fasl"
   :FASL-SHA256
   "71b8d624049de2eb32ede292a5b0ecdab5979a669bb12db09fd6c6185985c9a8")
  (:FILE "tests/get-directory/construction.lisp" :SOURCE-SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-directory/construction.fasl"
   :FASL-SHA256
   "bf1d25d69f62c5d8e92daea37c9d066d0c4849be978e3427e9e38cb27c447beb")
  (:FILE "tests/get-active/support.lisp" :SOURCE-SHA256
   "34c73b5323272a24fc01c132133d3cc74be7c00fa7ddd4ad08b8146bb42d589f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-active/support.fasl"
   :FASL-SHA256
   "d61f300f7cb1599635ce2282e23937e4a55367a6e5e30dfcc2aec9ec2a0fa1b9")
  (:FILE "tests/get-active/read.lisp" :SOURCE-SHA256
   "ef1a15c742518b52bdbeecac6b838b0789b73d631f765a30fd016748769a72e6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-active/read.fasl"
   :FASL-SHA256
   "20bdd322f5239cdcbc74579ea948bc31422b19bc8847c0a10d416d34f9bb262f")
  (:FILE "tests/get-active/preflight.lisp" :SOURCE-SHA256
   "c65ef56f5f7498d4355e6a1f640969e3e31724fab9b84b5c3247e4e9d37626e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-active/preflight.fasl"
   :FASL-SHA256
   "e4613309c9b483ef1cd1a54d712c0179ffdfe7a3af2a4530d7769ff33c259fd6")
  (:FILE "tests/get-active/directory.lisp" :SOURCE-SHA256
   "ea6754ab84b53a4be1722985600e280fde6f73da4ea7eb843e99d66989df6fdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-active/directory.fasl"
   :FASL-SHA256
   "5e436b8e19089e78b4c4aa69d5ebb55e886d89a305b8075a61a88caa4d65988c")
  (:FILE "tests/get-active/construction.lisp" :SOURCE-SHA256
   "31a21762f3c16950e4b6c0ce48a6ab235d2483476d03d4072d63905f7dd13deb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/get-active/construction.fasl"
   :FASL-SHA256
   "90a0b38ff1a5b2903e66094b02b598eaa078ebb4add161ac920e62fa8d688145")
  (:FILE "tests/foundation/support.lisp" :SOURCE-SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/foundation/support.fasl"
   :FASL-SHA256
   "7a11ca72e18cfb0a2b6c14f3fde6e34d74429ba89a46044caae8fa6f1a8f4850")
  (:FILE "tests/foundation/record.lisp" :SOURCE-SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/foundation/record.fasl"
   :FASL-SHA256
   "d24c873988a7ee4a8e7631d486cb9e8127d0b26255d0bc6914f4e5558d6a1969")
  (:FILE "tests/foundation/binary.lisp" :SOURCE-SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/foundation/binary.fasl"
   :FASL-SHA256
   "1e1146b902a80eb81dc02302f85b621add8eb697e3aa89200bdf1c8629a736d7")
  (:FILE "tests/foundation/batch.lisp" :SOURCE-SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/foundation/batch.fasl"
   :FASL-SHA256
   "605f0cbde7dfe3009e960e70957ba67009c51672a4537e8e166a3ac6bbcaeff6")
  (:FILE "tests/execution/worker.lisp" :SOURCE-SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/worker.fasl"
   :FASL-SHA256
   "cba859c662842376b4497926aa8614f96c00821e9c132f45b740ba7676e964cc")
  (:FILE "tests/execution/threads.lisp" :SOURCE-SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/threads.fasl"
   :FASL-SHA256
   "2a20dd50ab3c2f27d1a273d1dad7d568ee94742615238291292e3a511bf13fdf")
  (:FILE "tests/execution/support.lisp" :SOURCE-SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/support.fasl"
   :FASL-SHA256
   "d97fa44c97e65613362d521c3f9bc520db46ae21fb2afd34abc603e301067a06")
  (:FILE "tests/execution/ready.lisp" :SOURCE-SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/ready.fasl"
   :FASL-SHA256
   "efb74b3a550fd0261b37e56b081da88f15f3d47116a03de1953acecf275071e1")
  (:FILE "tests/execution/ready-recycle.lisp" :SOURCE-SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/ready-recycle.fasl"
   :FASL-SHA256
   "f5063222dc103b21ebb1558f43ff248791a9bc1cee6d6dcf6f7db728777d322a")
  (:FILE "tests/execution/queue.lisp" :SOURCE-SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/queue.fasl"
   :FASL-SHA256
   "29ae8c1c2a0499f3c42be6d551ab963b79ce390bb557fdaf039c18803726313f")
  (:FILE "tests/execution/handoff.lisp" :SOURCE-SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/execution/handoff.fasl"
   :FASL-SHA256
   "f793f411a10b586a55df20c9aaf032370da8c8237f8dcbcb65f2f5784d7dfd45")
  (:FILE "tests/epochs/threads.lisp" :SOURCE-SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/epochs/threads.fasl"
   :FASL-SHA256
   "1060929a280c814de00cc1acf66925b4d6e264aaa961594c5c0a130a70d4176d")
  (:FILE "tests/epochs/support.lisp" :SOURCE-SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/epochs/support.fasl"
   :FASL-SHA256
   "50daeb1a3b8fe293c86ae97bf7fe3ec96b66d8e0e4d80bd01fd3a2ec46eb37f7")
  (:FILE "tests/epochs/lifecycle.lisp" :SOURCE-SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/epochs/lifecycle.fasl"
   :FASL-SHA256
   "f83f3b12830c3d69861c4877b4d6433e4075054872874eb85cc7c1fb1f72c26d")
  (:FILE "tests/csn/threads.lisp" :SOURCE-SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/csn/threads.fasl"
   :FASL-SHA256
   "359a07f8a344a72b88375a52f1f46b1f9accfbb2cde91f3e87a24673a96d5371")
  (:FILE "tests/csn/support.lisp" :SOURCE-SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/csn/support.fasl"
   :FASL-SHA256
   "ddd541760fdbd9a2d30ec43d04f4d567c46f27eead8e692f4e7a137e3ef19314")
  (:FILE "tests/csn/registry.lisp" :SOURCE-SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/csn/registry.fasl"
   :FASL-SHA256
   "3ebe947c8e5d457c4b72c9696c1762526c9c81a99bf9359d38ab814340c40458")
  (:FILE "tests/codec/utf8.lisp" :SOURCE-SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/utf8.fasl"
   :FASL-SHA256
   "3083cbb118312c03292d6eeb136690357d04659baa726ff802c132908f8f57db")
  (:FILE "tests/codec/threads.lisp" :SOURCE-SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/threads.fasl"
   :FASL-SHA256
   "796a1508a3ec0caa3673462f3902b8bbff91275ff0c1eee9f9f20beb6064ee58")
  (:FILE "tests/codec/support.lisp" :SOURCE-SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/support.fasl"
   :FASL-SHA256
   "80330e48c5592cbba9a211377bf5560df72afc8ce6b7b479b484314e2d11ffed")
  (:FILE "tests/codec/cbor-write.lisp" :SOURCE-SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-write.fasl"
   :FASL-SHA256
   "0429043cbc222d37b3057783c48df8f8499f718e71f5e756eacd5ed974486574")
  (:FILE "tests/codec/cbor-write-threads.lisp" :SOURCE-SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-write-threads.fasl"
   :FASL-SHA256
   "5b67fc765b3bf39ff8025bf948b0ddf4bbdf5f6d001acae0562fe07ea838a108")
  (:FILE "tests/codec/cbor-write-support.lisp" :SOURCE-SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-write-support.fasl"
   :FASL-SHA256
   "2304270bb295c55913d44d188e02dd266a38f49f58a5783df8d6a56d126b904b")
  (:FILE "tests/codec/cbor-write-roundtrip.lisp" :SOURCE-SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :FASL-SHA256
   "2cc712346b8a14feca155be344530187f894183a610c37ef43d5732faf400e98")
  (:FILE "tests/codec/cbor-threads.lisp" :SOURCE-SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-threads.fasl"
   :FASL-SHA256
   "063c6f2f539146bf453170ce0b0fa49e58a8908426b9fda3170fe56380eaff4d")
  (:FILE "tests/codec/cbor-support.lisp" :SOURCE-SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-support.fasl"
   :FASL-SHA256
   "93f6513c04c7669df98e445f33958b9c90208175c528350ed09c6f0f11910d72")
  (:FILE "tests/codec/cbor-structure.lisp" :SOURCE-SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-structure.fasl"
   :FASL-SHA256
   "388aea6e8bda521966a374e783dfc44f21de66bd1161e22a320fad6f09872a9f")
  (:FILE "tests/codec/cbor-structure-threads.lisp" :SOURCE-SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-structure-threads.fasl"
   :FASL-SHA256
   "9a019bbe58c1af48b6ec55225304c515e41d0261b33c69c67a7bf933d1e918b1")
  (:FILE "tests/codec/cbor-structure-support.lisp" :SOURCE-SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-structure-support.fasl"
   :FASL-SHA256
   "1bfabfcfab74974bbdb4d58664211b4be3002ab3c7c6fa4fab2c41073bd6085c")
  (:FILE "tests/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "76610ccf3bd5f55b7f1fe365ef88204964c475a76a33aa3303d72a30bc461579")
  (:FILE "tests/codec/cbor-string-write-threads.lisp" :SOURCE-SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-string-write-threads.fasl"
   :FASL-SHA256
   "1dfd4eddf22bdec274bed73296f113cd913d77296f195b1b1eab75d7a282d708")
  (:FILE "tests/codec/cbor-string-write-support.lisp" :SOURCE-SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-string-write-support.fasl"
   :FASL-SHA256
   "f743d6e7c9ccc9e4d388ebf75411df81e2f38dd24d215ac8665082e528dc496b")
  (:FILE "tests/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "46f38d251acf277a4dd4b54d939f5893b4a5ff3659ce42b7bfbeef81482243bd")
  (:FILE "tests/codec/cbor-simple-write-threads.lisp" :SOURCE-SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :FASL-SHA256
   "26dd03c27fc5a7c646f05f2e738ba8d8f33672b286e3054afc1b10fdc3129036")
  (:FILE "tests/codec/cbor-simple-write-support.lisp" :SOURCE-SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-simple-write-support.fasl"
   :FASL-SHA256
   "79baf8a789dce38e0b5bbe123a444ad017214af1375eaf9f46bcf8b0e53c389d")
  (:FILE "tests/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "bd4e737a7a0905c4d09c1391e5a584f8cc41b5d19914be16309e0f37a1db7d2f")
  (:FILE "tests/codec/cbor-minimal-threads.lisp" :SOURCE-SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-threads.fasl"
   :FASL-SHA256
   "854d8714a7e1f08725d16f53027b4f4d0448bee5c92a7803d35bbe1b4a96e107")
  (:FILE "tests/codec/cbor-minimal-support.lisp" :SOURCE-SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-support.fasl"
   :FASL-SHA256
   "12f4dc5739022fbe543ec98b4be95fa72da3ec33ba739dc34e96da5c7c688d82")
  (:FILE "tests/codec/cbor-minimal-scan.lisp" :SOURCE-SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-scan.fasl"
   :FASL-SHA256
   "c6003d38cbfe402d48edf8847dec04eaa06994bf2388ef8bab0fe92365422683")
  (:FILE "tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE-SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :FASL-SHA256
   "032e973c4511d2dd2c223f50216ed8a784cddb7b5983154a005afdf157b9694f")
  (:FILE "tests/codec/cbor-minimal-scan-support.lisp" :SOURCE-SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :FASL-SHA256
   "d6231a45a322b5a3ff50dcde5104b8398945d4e00a97216f991a85d978da5a9e")
  (:FILE "tests/codec/cbor-minimal-edges.lisp" :SOURCE-SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-minimal-edges.fasl"
   :FASL-SHA256
   "3d35499ce7196095c6675f033bd8d3f461918c4e8575193beaab18794f896d12")
  (:FILE "tests/codec/cbor-header.lisp" :SOURCE-SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-header.fasl"
   :FASL-SHA256
   "b5d57f615b3361e6cd640ed3ebe648a71790076063b0a4b609376c5900d5add9")
  (:FILE "tests/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "f2fd06fd5b64021a9528b088de9ea8e77f4f7bb1587aff2869dbeec552a8020a")
  (:FILE "tests/codec/cbor-float-write-threads.lisp" :SOURCE-SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-float-write-threads.fasl"
   :FASL-SHA256
   "9d8e2bd5696cc6ca5c2eca764a9bd288a966ab19ad481f37534646cab741ec01")
  (:FILE "tests/codec/cbor-float-write-support.lisp" :SOURCE-SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-float-write-support.fasl"
   :FASL-SHA256
   "a62e19dff63812263c43b9a4a228195ecdc6effddeab873443192d32cd6b0dab")
  (:FILE "tests/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "edd62990e09fc0d9e88c1ef1d6300269f4314fccd44e3adcbffc7c0d5edddbeb")
  (:FILE "tests/codec/cbor-array-write-threads.lisp" :SOURCE-SHA256
   "6be0614da2bafdafe2d853fa7845fb913dbf0cd2673771c2c4b0cca277986e35" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-array-write-threads.fasl"
   :FASL-SHA256
   "71e36958c8d7e8d1052af483fab6fd5d01239a347180755fe47678a7b7439556")
  (:FILE "tests/codec/cbor-array-write-support.lisp" :SOURCE-SHA256
   "42a59239bec468dea130b87733a077874a5d9e83ff0f491b20312315bc27ee95" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/tests/codec/cbor-array-write-support.fasl"
   :FASL-SHA256
   "9faa5e1512dd22aa6ac3fd276520580b052b2374288fdfff48a70c7beb8d91ff")
  (:FILE "src/wal/types.lisp" :SOURCE-SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/types.fasl"
   :FASL-SHA256
   "bc6704577470ab6933efc4fe75561497c52404e71b1a1a259f1c283a7acd6dc0")
  (:FILE "src/wal/package.lisp" :SOURCE-SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/package.fasl"
   :FASL-SHA256
   "bba1dec601db1d82d5758d6115bb3478a1982236c4ad7b1c84c01f846ee5c54e")
  (:FILE "src/wal/group.lisp" :SOURCE-SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/group.fasl"
   :FASL-SHA256
   "8b1cfc3b7ee644f0350a4d115c871d666d9d618f830a576c04045133604f20b2")
  (:FILE "src/wal/executor.lisp" :SOURCE-SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/executor.fasl"
   :FASL-SHA256
   "976f240d8d8218145c59a076788d047158341321391766903abfc18aaca261a2")
  (:FILE "src/wal/csn.lisp" :SOURCE-SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/csn.fasl"
   :FASL-SHA256
   "8aa7b5b38cbe84f133661bdaaed30436b2672c2da87be898a3b9be7b231ae72c")
  (:FILE "src/wal/builder.lisp" :SOURCE-SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/wal/builder.fasl"
   :FASL-SHA256
   "e3424f5d7742c89eff28bc06f7ba013bfffc824f2889243145fd89b67f9c8c24")
  (:FILE "src/storage/segment-header.lisp" :SOURCE-SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/segment-header.fasl"
   :FASL-SHA256
   "25eba9a36f1ce280443ccd076fd213608b0df73d415113367bec70d2923eb7f2")
  (:FILE "src/storage/payload-write.lisp" :SOURCE-SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/payload-write.fasl"
   :FASL-SHA256
   "96c8a68ac2c921c8c591b99b7ce000f0d271ad6557a1ed2b5b5f65104c9e84f4")
  (:FILE "src/storage/payload-record.lisp" :SOURCE-SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/payload-record.fasl"
   :FASL-SHA256
   "c87904c0dcdb087335dc27a32a7fe684429cc39dee0aa815f1398c4d3ed5cb16")
  (:FILE "src/storage/package.lisp" :SOURCE-SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/package.fasl"
   :FASL-SHA256
   "07435a839f51ea9c96731d994b6a9a6b1c18db82cb03671760cdde2edc8b832c")
  (:FILE "src/storage/log-header.lisp" :SOURCE-SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/log-header.fasl"
   :FASL-SHA256
   "725837a9d381d04532ed46f602c01cd7ffde1a8e6c3b347239075ff916959977")
  (:FILE "src/storage/formats.lisp" :SOURCE-SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/formats.fasl"
   :FASL-SHA256
   "05d6b80076b0b15f0ea3583f818e0c7db119b80608f9ffa8400bdb757ac1f991")
  (:FILE "src/storage/control-payload.lisp" :SOURCE-SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/control-payload.fasl"
   :FASL-SHA256
   "8b710cbfcf224269802d12c8f0a0a31bf554ca872596d2b269ca1a967963c0cd")
  (:FILE "src/storage/compaction-scan.lisp" :SOURCE-SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/storage/compaction-scan.fasl"
   :FASL-SHA256
   "eaad78eb418a182513b3fd35c8628a2124b243358516729d88c84456fa00cc5b")
  (:FILE "src/series/worker-types.lisp" :SOURCE-SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/worker-types.fasl"
   :FASL-SHA256
   "b0c6a267f4784e2ac1afa13115888360fb16579dbe70699bf71d4486e07bd9c1")
  (:FILE "src/series/worker-run.lisp" :SOURCE-SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/worker-run.fasl"
   :FASL-SHA256
   "e09bcdcc94f7caca81142108c32dfa1fb3d48ece5f5e60a915eeae378fc968eb")
  (:FILE "src/series/worker-package.lisp" :SOURCE-SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/worker-package.fasl"
   :FASL-SHA256
   "8fa34dcba31f47cb2a48db5504a987f292da05052fbfab65b8eacb046e0abe74")
  (:FILE "src/series/worker-boundary.lisp" :SOURCE-SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/worker-boundary.fasl"
   :FASL-SHA256
   "539a367cbc1014b7f48d59529d3c3cbd56eac4c4dc7667b166a44e294a0e06ec")
  (:FILE "src/series/types.lisp" :SOURCE-SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/types.fasl"
   :FASL-SHA256
   "1608b2391e2128be621a0aebdfafdc28d0f1b1cbddea8b700e6a01955e562dba")
  (:FILE "src/series/routing-types.lisp" :SOURCE-SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/routing-types.fasl"
   :FASL-SHA256
   "a3e6a299384c6974b2b30d361c426c0d3e825ad656d1079cbcd0041fe4da54d8")
  (:FILE "src/series/routing-select.lisp" :SOURCE-SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/routing-select.fasl"
   :FASL-SHA256
   "c74eee9e145fa043fb30a343668eb8489bd8fc3f01f63b0f8f45a6b9bccd8c67")
  (:FILE "src/series/routing-build.lisp" :SOURCE-SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/routing-build.fasl"
   :FASL-SHA256
   "1adf16e0daac366f00e4f819d180d8f1d935f39a7dc7fa796a48a240fb0decd1")
  (:FILE "src/series/retirement.lisp" :SOURCE-SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/retirement.fasl"
   :FASL-SHA256
   "6ef621b41e453ab955554ba9b8e8fd2b723a9ae46d5b452d13b015a636477139")
  (:FILE "src/series/query.lisp" :SOURCE-SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/query.fasl"
   :FASL-SHA256
   "7837102fabc4472755d08d6ab108bb4ac65513bfda0d37b0793eac1baee9c0f6")
  (:FILE "src/series/publication.lisp" :SOURCE-SHA256
   "5de121c83ea6bd1243e420d9d898102aebb054cd1fa7ac79fcde9bf0792a95d8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/publication.fasl"
   :FASL-SHA256
   "ecf78a1bc3599c0603e9c0242c090fd3c79ef7845f264d9a7ad5a3cbbce81158")
  (:FILE "src/series/package.lisp" :SOURCE-SHA256
   "9a402f5225860c483dec9064a84d6462d28f5377a27977a63f64a5fbdbdd3764" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/package.fasl"
   :FASL-SHA256
   "396e1c887b91993579f08cd6b62a755b0a640cdea244bfc529d99ac92fe0ac50")
  (:FILE "src/series/ownership.lisp" :SOURCE-SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/ownership.fasl"
   :FASL-SHA256
   "8842baf12e579a9b2dc2afa749e8cd9b676fcd8f3222c3f9a4e001df0dca76a0")
  (:FILE "src/series/io-events.lisp" :SOURCE-SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/io-events.fasl"
   :FASL-SHA256
   "004bda2a9e2a48ef03045789fdcbeb05609bfee3e0f00d563838fbf06ad30116")
  (:FILE "src/series/events.lisp" :SOURCE-SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/series/events.fasl"
   :FASL-SHA256
   "0a86f7dd4c9308965b4788f775453567ed89a250a3e83a5cffe30cbeb05c4504")
  (:FILE "src/scheduler/update.lisp" :SOURCE-SHA256
   "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/update.fasl"
   :FASL-SHA256
   "7bb1b7eac3d3a61e57b09370f0eb154ab08e578f5d8f1dd231e6c9701c4f7393")
  (:FILE "src/scheduler/types.lisp" :SOURCE-SHA256
   "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/types.fasl"
   :FASL-SHA256
   "799f36a029b84d3b7ed79844126b53c7b7bfb4e225a67ba5facb813693be8c54")
  (:FILE "src/scheduler/read.lisp" :SOURCE-SHA256
   "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/read.fasl"
   :FASL-SHA256
   "e107e8e71531d847ab48d847e143420f4321cd8d3360d61ef55ae4e993f95b58")
  (:FILE "src/scheduler/pool-claim.lisp" :SOURCE-SHA256
   "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/pool-claim.fasl"
   :FASL-SHA256
   "7bd09b91682feba9358fbb1d003301fd1638eff102146cca33563eee0f80dcc1")
  (:FILE "src/scheduler/policy.lisp" :SOURCE-SHA256
   "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/policy.fasl"
   :FASL-SHA256
   "a5973351feb1d6a6685afea361b456d092ff819014624cf1305043a7e0616216")
  (:FILE "src/scheduler/package.lisp" :SOURCE-SHA256
   "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/package.fasl"
   :FASL-SHA256
   "ed9037986e865146f728ce2e9b0065b3157fc6a9fe6e77c9b03b8e2ce6ce247b")
  (:FILE "src/scheduler/lifecycle-worker.lisp" :SOURCE-SHA256
   "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/lifecycle-worker.fasl"
   :FASL-SHA256
   "281d3e3a4a6e2a6c4ac15e6134c7445430b12b22f8306a2bf7263173fe3b0762")
  (:FILE "src/scheduler/lifecycle-update.lisp" :SOURCE-SHA256
   "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/lifecycle-update.fasl"
   :FASL-SHA256
   "883430701c9e29bf369c95219ecb5ab11be7520463354a33bd456205b392e0b2")
  (:FILE "src/scheduler/lifecycle-types.lisp" :SOURCE-SHA256
   "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/lifecycle-types.fasl"
   :FASL-SHA256
   "356b099eb8ed35c457197a250ab20826f866c0740b5f39bb5b2bbbf61abc4f23")
  (:FILE "src/scheduler/lifecycle-read.lisp" :SOURCE-SHA256
   "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/lifecycle-read.fasl"
   :FASL-SHA256
   "efbf8f57b6afa0b65aae5de02782ee8f3c8a5dd38bcf61606b0db3fef772f924")
  (:FILE "src/scheduler/lifecycle-build.lisp" :SOURCE-SHA256
   "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/lifecycle-build.fasl"
   :FASL-SHA256
   "3c80909ee376338f478cda9b9c3117d1778a902a7d4a93e71e6ec59e5af4bfca")
  (:FILE "src/scheduler/build.lisp" :SOURCE-SHA256
   "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/scheduler/build.fasl"
   :FASL-SHA256
   "2e2afaf7a1db0b2960488cbc3c3b6cee9ba2a1ddc4b359db2c4716f6965613f0")
  (:FILE "src/recovery/scan.lisp" :SOURCE-SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/scan.fasl"
   :FASL-SHA256
   "8c498a0b9ff12ef2878be22558476f2aa79524566adb65819593f74f8cf68725")
  (:FILE "src/recovery/package.lisp" :SOURCE-SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/package.fasl"
   :FASL-SHA256
   "2b39adb99ba0a1f7c51db81c112224d6d268d6d644985246c54fa5f1a5670b57")
  (:FILE "src/recovery/manifest-types.lisp" :SOURCE-SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-types.fasl"
   :FASL-SHA256
   "c751623f75f94843af0d6cea7e5c11ca2719ea06bef61c3aece7ac2f705f5ac7")
  (:FILE "src/recovery/manifest-query.lisp" :SOURCE-SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-query.fasl"
   :FASL-SHA256
   "457e646859f326c9cd135d2329f841e41bf5a14fa1ac4175dcc47986fde0678d")
  (:FILE "src/recovery/manifest-package.lisp" :SOURCE-SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-package.fasl"
   :FASL-SHA256
   "c11f0d286d753cb8d984d7ce0396903776b507f3a009200936ccad2f75c1ebc7")
  (:FILE "src/recovery/manifest-fold.lisp" :SOURCE-SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-fold.fasl"
   :FASL-SHA256
   "aceb78912e444dc36f702f548bcb0801022b28d9649fa7472145cffe92983883")
  (:FILE "src/recovery/manifest-decode.lisp" :SOURCE-SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-decode.fasl"
   :FASL-SHA256
   "daf604ab8814f295dd58499877b93667f8457db6e03a4e90dd81bc850199912f")
  (:FILE "src/recovery/manifest-build.lisp" :SOURCE-SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/manifest-build.fasl"
   :FASL-SHA256
   "5e547b52b81d9ea1bc3a38282f79e77a635e851ab54f4f22f12004ac1affa36d")
  (:FILE "src/recovery/inventory-types.lisp" :SOURCE-SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/inventory-types.fasl"
   :FASL-SHA256
   "28f945f7b450c49a3779ba211a69738807fd923947574c09177622a9e88f7689")
  (:FILE "src/recovery/inventory-query.lisp" :SOURCE-SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/inventory-query.fasl"
   :FASL-SHA256
   "deee5acc4a7da839472ef9b1271936404c23bafe0d4fd2b2521e5855e17c2463")
  (:FILE "src/recovery/inventory-build.lisp" :SOURCE-SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/inventory-build.fasl"
   :FASL-SHA256
   "b5df8718ceaaaeeaf59fb4ba659a48b7d05a3f09b3c77eaeeae9b7999c32db55")
  (:FILE "src/recovery/decisions-types.lisp" :SOURCE-SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-types.fasl"
   :FASL-SHA256
   "6d3df9a752b7db5887bff1861d9bdae5306dce455fa147fed806e5284bf11884")
  (:FILE "src/recovery/decisions-sort.lisp" :SOURCE-SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-sort.fasl"
   :FASL-SHA256
   "7696587fbd65b0fc9d97c6fd0c6e059440ba31d86a56fe64baec60621caa845e")
  (:FILE "src/recovery/decisions-radix.lisp" :SOURCE-SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-radix.fasl"
   :FASL-SHA256
   "ee12e9a79cef61f44c72e87a778b521ce4f69118abbd966529eb01c71c261188")
  (:FILE "src/recovery/decisions-query.lisp" :SOURCE-SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-query.fasl"
   :FASL-SHA256
   "2dbb0860040b696a5cf077183763abf8a34846ec585888f4340079a7919f9daf")
  (:FILE "src/recovery/decisions-package.lisp" :SOURCE-SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-package.fasl"
   :FASL-SHA256
   "e56f48b69dfe501775eb47062b691e13f22efe3ca3b75919c4fc478ad1b47d8b")
  (:FILE "src/recovery/decisions-build.lisp" :SOURCE-SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/recovery/decisions-build.fasl"
   :FASL-SHA256
   "fe1d1c14164ea48465c4c26e7a53aa54743d8026625a63ea3f1811ce57407a39")
  (:FILE "src/read/types.lisp" :SOURCE-SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/read/types.fasl"
   :FASL-SHA256
   "2dec8f6b1c79a370fc3a573758bce49e3ae69f4e287a4714869a7773892d831b")
  (:FILE "src/read/task.lisp" :SOURCE-SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/read/task.fasl"
   :FASL-SHA256
   "7c87d56f1c6b8f3f0c674229abf42e242524da7267bca10d4accb6bf1f74a2ea")
  (:FILE "src/read/package.lisp" :SOURCE-SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/read/package.fasl"
   :FASL-SHA256
   "7cd158a80e9bedddffe012fe6879d81c12b44fb8465a655759ce1c85d8800a9e")
  (:FILE "src/read/core.lisp" :SOURCE-SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/read/core.fasl"
   :FASL-SHA256
   "6617f65a0874cd47c129b9baf1e16f47039834e875c0bbaacfada5f1190b979c")
  (:FILE "src/package.lisp" :SOURCE-SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/package.fasl"
   :FASL-SHA256
   "fa3e083189727948f7757877aaef8242dfc7ce9f4623900313ed59f9c4391c61")
  (:FILE "src/mvcc/types.lisp" :SOURCE-SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/types.fasl"
   :FASL-SHA256
   "4602514a5727079aed6516fd6f5667cb25b4eb507ccf0ebc6225ec4ece98a3ba")
  (:FILE "src/mvcc/snapshots-types.lisp" :SOURCE-SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-types.fasl"
   :FASL-SHA256
   "59b351bf65ed3546c690c1038a42193d2a13fa4ce16ad79350a50ae3581b8f8a")
  (:FILE "src/mvcc/snapshots-register.lisp" :SOURCE-SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-register.fasl"
   :FASL-SHA256
   "ac9538569afb5650cae265a24483898708e681ebd66113e1706acac197f55a51")
  (:FILE "src/mvcc/snapshots-read.lisp" :SOURCE-SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-read.fasl"
   :FASL-SHA256
   "e5cd9b7be2ee5570b85966df74332756112e1997a93209b70d0665d4e3da5b17")
  (:FILE "src/mvcc/snapshots-lifecycle.lisp" :SOURCE-SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-lifecycle.fasl"
   :FASL-SHA256
   "698fb5d7610122ead679456be369e6a46e900b7e112a30a039c77f225151c91e")
  (:FILE "src/mvcc/snapshots-csn.lisp" :SOURCE-SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-csn.fasl"
   :FASL-SHA256
   "14495d940439420009ac38267f95a81c7c8a0cf9933310c13d0e1d6c30026a8d")
  (:FILE "src/mvcc/snapshots-core.lisp" :SOURCE-SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/snapshots-core.fasl"
   :FASL-SHA256
   "42201ad1465292702d0026e7e8215fbf134035875b7aa93e0da29ed5f8d0dc24")
  (:FILE "src/mvcc/package.lisp" :SOURCE-SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/mvcc/package.fasl"
   :FASL-SHA256
   "fb92bd5f6301f4e84ec068153477e316e4faceee7af29bead7d085edf97d4aa6")
  (:FILE "src/io/types.lisp" :SOURCE-SHA256
   "68df36ae5167c975261f99d63a6598bca1fe93caca02f39e18812e94fcf1b233" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/types.fasl"
   :FASL-SHA256
   "f6d52af78fb8542fc0611d91aa386bc51073b5285b094cc0d9e6af644fa2be4e")
  (:FILE "src/io/transfer.lisp" :SOURCE-SHA256
   "c807f294d0211e8433f8f0332ab6ba3ce7d9ae7de3818f43af7ff8d7fcfd341a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/transfer.fasl"
   :FASL-SHA256
   "22c48aaf171b55e3f049cb8e2385c0bbb69738bcacc8d358f6a49f4bd1d11363")
  (:FILE "src/io/rename.lisp" :SOURCE-SHA256
   "ef9475701a2da4a44d98f9c88a1f547f3be1f07c649c8c3c956c206c80a55598" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/rename.fasl"
   :FASL-SHA256
   "9491b1a8612bc04f3c44ec3090564251c9be9bb0412a1f43fe55ed121868897b")
  (:FILE "src/io/package.lisp" :SOURCE-SHA256
   "605f51109d723267b326c012602a91e7deff984a040c3440d90665b853e3549c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/package.fasl"
   :FASL-SHA256
   "3b87002604ed2a45f9c8c22c890c504ccc9238b7eab7c1e79b3278d04836e821")
  (:FILE "src/io/native.lisp" :SOURCE-SHA256
   "74f63dbb2137a344054e82c6707e6262473b3332ff66a85f79ecfee9fd50f9b4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/native.fasl"
   :FASL-SHA256
   "bf9d6db6114ad8fa11021416ec3782c16b15ed0610643b36550af23ed861f6d2")
  (:FILE "src/io/native-namespace.lisp" :SOURCE-SHA256
   "3a7ada1ffe09c94714629a3679bf26a56bd5570ff3bf06acbce4be83750a47ad" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/native-namespace.fasl"
   :FASL-SHA256
   "ed9608ec590ed181d6fd0a722ba3d8b45b9b45e9a9630f4e3a23c1f9c990bb7e")
  (:FILE "src/io/namespace.lisp" :SOURCE-SHA256
   "f23b46209fa87bee4deee84dbe3d87bc7a20d0a4f98bdafe7d40391fc42e1b59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/namespace.fasl"
   :FASL-SHA256
   "8150fe255cba43e4c99adfd3a01f562eb516157ebf6afe24c3d472cc42b5ba7c")
  (:FILE "src/io/lifecycle.lisp" :SOURCE-SHA256
   "88e72ad54b8c8048358cbca2d136c62883d8e700d63d92e807cb14df0082ae6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/lifecycle.fasl"
   :FASL-SHA256
   "d5daf0a84457008706afe1b7c06c8be60d411fd4674bf9c818cf868a89537d62")
  (:FILE "src/io/identity.lisp" :SOURCE-SHA256
   "d2b6f7932b66f2ef74241e573ed253cf9b710f217cd570ef23f6671614d90a2c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/identity.fasl"
   :FASL-SHA256
   "46748668b04d76dd502e4390b5269ec6ef44eeda0c85c894d929dc7fecfd6e37")
  (:FILE "src/io/identity-types.lisp" :SOURCE-SHA256
   "5794dd5094f34c24e7e09e4a7937f1988d85ea9cd37e478abaf836273da5d5c1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/identity-types.fasl"
   :FASL-SHA256
   "d96ed8b31d61d0d8af0b1e1e948eb17c0cba82286df2e06d306b80e20b238b7c")
  (:FILE "src/io/flush.lisp" :SOURCE-SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/io/flush.fasl"
   :FASL-SHA256
   "fcb96309ebed080176191e06fc1ad10cc069a2ff93d301bc407b9aa69d377f39")
  (:FILE "src/index/write.lisp" :SOURCE-SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/write.fasl"
   :FASL-SHA256
   "82ce66524397981e568814a4d1c23b92d225fde8903aff7f6bee58ced61a0400")
  (:FILE "src/index/validation.lisp" :SOURCE-SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/validation.fasl"
   :FASL-SHA256
   "a3d85e3b8e249d75c7246cb6bb59e22318f70cd67f3900eac46fc5f2fad000fb")
  (:FILE "src/index/types.lisp" :SOURCE-SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/types.fasl"
   :FASL-SHA256
   "7294cac867c452e6505c626571d8ea46a41e17632a972034b28fb421acaf18cb")
  (:FILE "src/index/relocate.lisp" :SOURCE-SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/relocate.fasl"
   :FASL-SHA256
   "3293fb3ae008e2b016c8763f388a271fc0bd1ff8e3eb50d2720c8324a5e0fc43")
  (:FILE "src/index/rebuild.lisp" :SOURCE-SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/rebuild.fasl"
   :FASL-SHA256
   "c48d13c869eb7bd04216c6684e0b8525ee5edd258753d53f09bb9ec19dfee1fc")
  (:FILE "src/index/rebuild-scan.lisp" :SOURCE-SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/rebuild-scan.fasl"
   :FASL-SHA256
   "b5db2a79da99271687511e7b2337710386cadf4a42119bf4c565e641368fe31b")
  (:FILE "src/index/rebuild-copy.lisp" :SOURCE-SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/rebuild-copy.fasl"
   :FASL-SHA256
   "c50749e47605d53ed8e6df702bc53e57fd14d2fb5f13a4258fd943387816771a")
  (:FILE "src/index/rebuild-budget.lisp" :SOURCE-SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/rebuild-budget.fasl"
   :FASL-SHA256
   "fe3ae4e6fd87059bb62328671e39a198e4a7e6b1ac47f5096129ce0f6f060288")
  (:FILE "src/index/read.lisp" :SOURCE-SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/read.fasl"
   :FASL-SHA256
   "0be0e5465c419becf33e1fc3dd26286a8aa85bb00bf8e5ae9e5465b882f97910")
  (:FILE "src/index/primary-write.lisp" :SOURCE-SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-write.fasl"
   :FASL-SHA256
   "2175d3018709a8aa03902372f0312fe98d9811b4d076508245f714d6d03314eb")
  (:FILE "src/index/primary-types.lisp" :SOURCE-SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-types.fasl"
   :FASL-SHA256
   "9b4ed5d9649ba0fb07a52ecd518e1d8d858007fbc8bc83a912f79586f1d1cbe6")
  (:FILE "src/index/primary-relocate.lisp" :SOURCE-SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-relocate.fasl"
   :FASL-SHA256
   "9e3a063cd6af42ed5b38a5adc3a0e26d680518b9e7f20a2500626ef319ed962c")
  (:FILE "src/index/primary-read.lisp" :SOURCE-SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-read.fasl"
   :FASL-SHA256
   "3fecda6525503c94b5188987284437ca48e5b119e738dd7d92810fea408ced7a")
  (:FILE "src/index/primary-probe.lisp" :SOURCE-SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-probe.fasl"
   :FASL-SHA256
   "9c95714cc399e71b554a79bbc08aa6e2aca3c047a083ea5e8da9137276775076")
  (:FILE "src/index/primary-package.lisp" :SOURCE-SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-package.fasl"
   :FASL-SHA256
   "d7a4f4cb9e096bf1a8a401a45169805adf0f6c21a65736be2b145035f18cb6e3")
  (:FILE "src/index/primary-directory.lisp" :SOURCE-SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-directory.fasl"
   :FASL-SHA256
   "6daa61e6e5c34776e817daeffc72834fc74f50c59a62c8d1d53cd8c540b26e1e")
  (:FILE "src/index/primary-core.lisp" :SOURCE-SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-core.fasl"
   :FASL-SHA256
   "825b3a0db2c74e79a6a7a411249568743924c7c92a461da9afc721120ecc928d")
  (:FILE "src/index/primary-build.lisp" :SOURCE-SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-build.fasl"
   :FASL-SHA256
   "92771e8b709b1315aa7e9859665e305abe606204671d2eb4efd00af65c02aa64")
  (:FILE "src/index/primary-arena.lisp" :SOURCE-SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/primary-arena.fasl"
   :FASL-SHA256
   "4034c25cce4a64560b879d01f6ba6b93808192537d2c945e3ceef9646f0d5c71")
  (:FILE "src/index/package.lisp" :SOURCE-SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/package.fasl"
   :FASL-SHA256
   "ee5d82912e8bc926ab9f659ef0c8c825c151e834ec07e70183d8572c469a6969")
  (:FILE "src/index/hash-seed.lisp" :SOURCE-SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/hash-seed.fasl"
   :FASL-SHA256
   "a0d7435f10f74b0e998e6666e164b21bfdccdff6165788560204d63dcf4ef793")
  (:FILE "src/index/hash-digests.lisp" :SOURCE-SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/hash-digests.fasl"
   :FASL-SHA256
   "3b87e8a0ea3ea92a95f7ad3ec958449f24f28d16a574692b9eefb5ecaa2b00db")
  (:FILE "src/index/core.lisp" :SOURCE-SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/index/core.fasl"
   :FASL-SHA256
   "e18de2e1ca1f41915bc9a29631c16f49de01572ad35bba75ecb7ba166440ccb7")
  (:FILE "src/hash/package.lisp" :SOURCE-SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/hash/package.fasl"
   :FASL-SHA256
   "233f4a9f9a8674749bfc32bd45c308230826bf55d842148f0160d32d70da4fb9")
  (:FILE "src/hash/hash64.lisp" :SOURCE-SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/hash/hash64.fasl"
   :FASL-SHA256
   "12b5ff702cbed57c7d4cfb45741eaa25393fbabe6ac16cb07b15cca9f19292e8")
  (:FILE "src/hash/blocks.lisp" :SOURCE-SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/hash/blocks.fasl"
   :FASL-SHA256
   "f4a172c8bc873d41c717ec7071d937600464405c97bc7ed349158a1f192789b1")
  (:FILE "src/hash/arithmetic.lisp" :SOURCE-SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/hash/arithmetic.fasl"
   :FASL-SHA256
   "b40f7d93be729637b464aba70e3d7a2c7ef70736b8110efbf7da8f6340d3e92c")
  (:FILE "src/get/types.lisp" :SOURCE-SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/types.fasl"
   :FASL-SHA256
   "1654422e32460b455f8d5fcc2bff563b3f60375a700f7e8119872329c6d2d69c")
  (:FILE "src/get/target.lisp" :SOURCE-SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/target.fasl"
   :FASL-SHA256
   "6102bafb4be4887a560d6a697b826a865643cede06e1e8d3929ec1c78849117b")
  (:FILE "src/get/segment.lisp" :SOURCE-SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/segment.fasl"
   :FASL-SHA256
   "ae777dfa1f7a095469ca0f7854b015d4b1e6ded84d20262aee6c8746e2df8fe1")
  (:FILE "src/get/package.lisp" :SOURCE-SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/package.fasl"
   :FASL-SHA256
   "31507ff0e043a7896f429df7df7494bdb234a776fbbcf2e8c065aa86102e681a")
  (:FILE "src/get/lookup.lisp" :SOURCE-SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/lookup.fasl"
   :FASL-SHA256
   "edbb922dd23ad2a97362ce5bd4a47bf239726caf43dd85d4c6e6381e20251b4e")
  (:FILE "src/get/lifecycle.lisp" :SOURCE-SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/lifecycle.fasl"
   :FASL-SHA256
   "9750ed363de4a0485622264d13bc7691af8608e587ad71dc393508e5d070fdc6")
  (:FILE "src/get/build.lisp" :SOURCE-SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get/build.fasl"
   :FASL-SHA256
   "aba7c585578b0de3d68212def9165dd2d48f35a7eb927ea7d54d4cc6970d410a")
  (:FILE "src/get-resolver/types.lisp" :SOURCE-SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/types.fasl"
   :FASL-SHA256
   "e28075a958c062c8a8926d2181024b5db6550def7788e43a029fba04e29c19bf")
  (:FILE "src/get-resolver/sort.lisp" :SOURCE-SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/sort.fasl"
   :FASL-SHA256
   "4f62b67bea7607e9ca0bad28ab355ca6f22170524cbdbfc145cfce1920e532aa")
  (:FILE "src/get-resolver/scan.lisp" :SOURCE-SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/scan.fasl"
   :FASL-SHA256
   "d423efad9be27316e73d8fbc6fcf74a39a8c7252d33b1d05d85864bbf3600ac2")
  (:FILE "src/get-resolver/rows.lisp" :SOURCE-SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/rows.fasl"
   :FASL-SHA256
   "e1ad06864d51186c1d1071cde24d11b68835eded89386e1db0aaa3cd74e02e98")
  (:FILE "src/get-resolver/read.lisp" :SOURCE-SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/read.fasl"
   :FASL-SHA256
   "14aad630620b3c2b1199ac2369e03be497d6dfc7b5e07a2258733c90b0c4e8e0")
  (:FILE "src/get-resolver/package.lisp" :SOURCE-SHA256
   "663a5a15a630ed2b9042a3a3365598358df97d3dd1cd3d7610b283526281f39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/package.fasl"
   :FASL-SHA256
   "33668fb32638566a21c981052e4a5ff6d4fbb396be25faaf5f9e20920ba44856")
  (:FILE "src/get-resolver/build.lisp" :SOURCE-SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/build.fasl"
   :FASL-SHA256
   "2cb8c99a32f56647251bb93b4dfc272832e5f4933aa806328a98f9cb400b49f2")
  (:FILE "src/get-resolver/active-types.lisp" :SOURCE-SHA256
   "a3cb954a265b263e0e03d2f1a80824589670efbf89adcd69007987d26df2e29a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-types.fasl"
   :FASL-SHA256
   "7a65860238160d2e652bdcf10c8ac8af47d6197bbfda20595fc0e2502e2cf9f6")
  (:FILE "src/get-resolver/active-scan.lisp" :SOURCE-SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-scan.fasl"
   :FASL-SHA256
   "dd0f05a4ea3e7dde65f1fc68eb3f4dda56c190338277dec20c5274170eb3298f")
  (:FILE "src/get-resolver/active-read.lisp" :SOURCE-SHA256
   "47630e5d42c785e39e15dd714177cd86159129a5391d82321385f92317bea659" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-read.fasl"
   :FASL-SHA256
   "4c9755f7bd61285d824da6aca18ab35ba6769a2e75f1d0b49652944c756e1a07")
  (:FILE "src/get-resolver/active-preflight.lisp" :SOURCE-SHA256
   "25be106b3d2c72b210c80d46bef7b83bea7a1db589d185d228992402f4dc0b81" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-preflight.fasl"
   :FASL-SHA256
   "55bd077d5bce0902fdecd9c9be68d02b0e951ffb6716fc4d78a9168b05d31b98")
  (:FILE "src/get-resolver/active-init.lisp" :SOURCE-SHA256
   "2f9380674cf4b590b071ab9d769a4b79292f544d920c0fc5ff33146dde7686f6" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-init.fasl"
   :FASL-SHA256
   "f43ac0cd7b3d4d7462967dfede28cdbda8533f340a2baa480088d62038f3e22b")
  (:FILE "src/get-resolver/active-directory.lisp" :SOURCE-SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-directory.fasl"
   :FASL-SHA256
   "8ba25e900477fcf2c4fac628b589d50b333b59a3a16e3399e2104e8e9d5dae07")
  (:FILE "src/get-resolver/active-build.lisp" :SOURCE-SHA256
   "0eed95930d41c515965ae8ab0a14fbb94597a42ea38b86f205ea0938cf4631de" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-resolver/active-build.fasl"
   :FASL-SHA256
   "fa4df6ce565f87d9a8827ddbaf8306efe118c0a551f1627814929e04eca66b5e")
  (:FILE "src/get-directory/types.lisp" :SOURCE-SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/types.fasl"
   :FASL-SHA256
   "23ae67507e73852affc48c35dc73ad25814b8d1b0bae28a33fd3ef003cb51102")
  (:FILE "src/get-directory/sources-types.lisp" :SOURCE-SHA256
   "862342b07d6a8aae834aaf3da4149682fcd1dcbdae971adad640597583547099" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/sources-types.fasl"
   :FASL-SHA256
   "8f5bdf0724740ef210dc566af9a55e0ae8e660f5f6ce9eb75a8291bda0314b42")
  (:FILE "src/get-directory/sources-read.lisp" :SOURCE-SHA256
   "ee4a3b81322fbd51ce928be0b73e9bc180af7ed39f936b68ec9a152dd2a180c2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/sources-read.fasl"
   :FASL-SHA256
   "0f7f30da21ad67f5b28e33e7919f15664584e2319a448255a1cb792ceb9af322")
  (:FILE "src/get-directory/read.lisp" :SOURCE-SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/read.fasl"
   :FASL-SHA256
   "34d29ca3f6ea47dc4a185ff7b8ec1c22213327139533ec0f79a211924d90051d")
  (:FILE "src/get-directory/package.lisp" :SOURCE-SHA256
   "e779202c8df502749a81d0c6f9f0d505d000e09231f3679b1a91303fbcbf36f9" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/package.fasl"
   :FASL-SHA256
   "3152d7dfbc91bc7c118c56e2d006b02e846823395515e1bbf76c853f5b46ff4d")
  (:FILE "src/get-directory/build.lisp" :SOURCE-SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/get-directory/build.fasl"
   :FASL-SHA256
   "80c03b505a457f8692c05e2a8949a9fde6ae921c9c873ab410a0ded44b0e815c")
  (:FILE "src/foundation/record.lisp" :SOURCE-SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/record.fasl"
   :FASL-SHA256
   "599ba92696a3ccd074bb25cab6660b69b02fd2ca659f60cd001c18abc416f890")
  (:FILE "src/foundation/package.lisp" :SOURCE-SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/package.fasl"
   :FASL-SHA256
   "628c8996bf0c8e4eed753a0a3c5e6a25c8a5cd08aef3d20602975173c8e261ed")
  (:FILE "src/foundation/crc32c.lisp" :SOURCE-SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/crc32c.fasl"
   :FASL-SHA256
   "b55e691107b92ef761c5a1296bc4a4db770aead8a72b0d1fbe0cb5ad65d0da68")
  (:FILE "src/foundation/conditions.lisp" :SOURCE-SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/conditions.fasl"
   :FASL-SHA256
   "0a883254ebb8e0e60a81b23ee009bcf60b5f54318282bafc520acbe657dcf821")
  (:FILE "src/foundation/binary.lisp" :SOURCE-SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/binary.fasl"
   :FASL-SHA256
   "0e39a4792b903622ac8465cdc42e96cb468c266ec4e612daca372c7484e1a4c4")
  (:FILE "src/foundation/batch.lisp" :SOURCE-SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/foundation/batch.fasl"
   :FASL-SHA256
   "e648e7c33e080b00de7751b6fbf6d670449204bee19543103e69e2164593e9ba")
  (:FILE "src/execution/writer.lisp" :SOURCE-SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/writer.fasl"
   :FASL-SHA256
   "8a875a0d332ae61151003c146e177f27078e999a17e50df07087cacaaa613ca8")
  (:FILE "src/execution/worker-types.lisp" :SOURCE-SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/worker-types.fasl"
   :FASL-SHA256
   "25f97c7027b53ad1d5be42a37ba2bcf36e432cdff8c1ba42b4711d6f5a054a90")
  (:FILE "src/execution/worker-run.lisp" :SOURCE-SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/worker-run.fasl"
   :FASL-SHA256
   "08e3ac5e01abcdb536bc614c1d78714be8bb78eef2f1963417f7df894ea1492d")
  (:FILE "src/execution/worker-claim.lisp" :SOURCE-SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/worker-claim.fasl"
   :FASL-SHA256
   "497676df8ec76d2cdf1b9ea3b10d41057415f28bce405034893b603f671b6b04")
  (:FILE "src/execution/worker-boundary.lisp" :SOURCE-SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/worker-boundary.fasl"
   :FASL-SHA256
   "415c0de0f81eb0347e6890f810caaafaa3135bc968f19e6ae87f772d9b71e5e7")
  (:FILE "src/execution/ready.lisp" :SOURCE-SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/ready.fasl"
   :FASL-SHA256
   "19ea8b82c8883c4182e2f5cfa43c4b4b950e12eaf39ce710ac5ebb28dc388b2b")
  (:FILE "src/execution/ready-types.lisp" :SOURCE-SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/ready-types.fasl"
   :FASL-SHA256
   "cacb5a2b313378e0d25374721b6ef12c2b54ac2833593b03f713aac6580be464")
  (:FILE "src/execution/ready-recycle.lisp" :SOURCE-SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/ready-recycle.fasl"
   :FASL-SHA256
   "96d4f7cca6b3a10d0cac7658304e2574a563d15e9a00e42b17db1ab5f638f66d")
  (:FILE "src/execution/queue.lisp" :SOURCE-SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/queue.fasl"
   :FASL-SHA256
   "f0d2a362a1088a5b1edb2b3eae36d6a56e38cc17dad7d0ea69f44a2f6d288579")
  (:FILE "src/execution/package.lisp" :SOURCE-SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/package.fasl"
   :FASL-SHA256
   "c7f9e882ecb598af4bd7f7fd757b259b36aaeabb78d9edae96c19241e4ad3e12")
  (:FILE "src/execution/handoff.lisp" :SOURCE-SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/execution/handoff.fasl"
   :FASL-SHA256
   "ea703793b4b96787a325c6c119a3292ed9e8b20bdcbfe08974d78e4bc409c445")
  (:FILE "src/epochs/types.lisp" :SOURCE-SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/types.fasl"
   :FASL-SHA256
   "2b802cf6081be05143271f35d2a7c036806dd21576f9535d93a307aa4897c0b1")
  (:FILE "src/epochs/retire.lisp" :SOURCE-SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/retire.fasl"
   :FASL-SHA256
   "45f9154fd952cf2392359e68553312b9f8bf5e7a7720e5ea23ab2d3e20ec18cb")
  (:FILE "src/epochs/reclaim.lisp" :SOURCE-SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/reclaim.fasl"
   :FASL-SHA256
   "2bb17f3d5270b75178a51518484d1dd56a4d69a7f40fe6058edffc7452831c37")
  (:FILE "src/epochs/read.lisp" :SOURCE-SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/read.fasl"
   :FASL-SHA256
   "c35beaea74d838144716f0581b21c06b7b730fcf6b238f113232f24ac09b7001")
  (:FILE "src/epochs/package.lisp" :SOURCE-SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/package.fasl"
   :FASL-SHA256
   "c76eba1e7b53aad7019ed3163645876f991462e12b7a917d28e655f41b646b78")
  (:FILE "src/epochs/core.lisp" :SOURCE-SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/epochs/core.fasl"
   :FASL-SHA256
   "444112dac0eee8ebc29c60f7b3b773f126eeacf07f3097cc5fa5caa39f3fd517")
  (:FILE "src/dispatch/types.lisp" :SOURCE-SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/dispatch/types.fasl"
   :FASL-SHA256
   "edc40c58236d8ce86af09006d38fbcd83543fddb77837104d55a1059d3f580dd")
  (:FILE "src/dispatch/package.lisp" :SOURCE-SHA256
   "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/dispatch/package.fasl"
   :FASL-SHA256
   "2071aec9f12db140ad46ca7c3c772cd89a6f0b2226ab8ffe965191c32c2bde93")
  (:FILE "src/dispatch/claim.lisp" :SOURCE-SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/dispatch/claim.fasl"
   :FASL-SHA256
   "4bbf48cabee72681821290b7b5dbe185573ac0a85c71686a70d139eed4fd633f")
  (:FILE "src/dispatch/build.lisp" :SOURCE-SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/dispatch/build.fasl"
   :FASL-SHA256
   "342bd83d1d33b112af832f29b198e096d7dcc165ae6afe879cf47486636af0a2")
  (:FILE "src/csn/registry.lisp" :SOURCE-SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/csn/registry.fasl"
   :FASL-SHA256
   "abafb80ee7e8aaec3c6cc9ac9d6041cbd810608a51f68ef5cd24212482107bd7")
  (:FILE "src/csn/package.lisp" :SOURCE-SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/csn/package.fasl"
   :FASL-SHA256
   "b1b9b31593639993418bc1246f963beafdf0cb740df8d10d52cf8c8356072534")
  (:FILE "src/control/types.lisp" :SOURCE-SHA256
   "ad2f45bcd44fed463d60b580a17d89192a1087177573b1633674ed68d252367d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/types.fasl"
   :FASL-SHA256
   "c84450667f8d2eb63bf8169734175fb097526ede96de62ab4eec672cc0396cea")
  (:FILE "src/control/transfer.lisp" :SOURCE-SHA256
   "6e257bfb6ce8e6d11263cc6788de4fc35657a82e159af7b46341c3bb208e0275" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/transfer.fasl"
   :FASL-SHA256
   "8fcea4ea7f122bc6053943b598e5fe8e947756f9fbc2eb48c8e706b736ac85d2")
  (:FILE "src/control/publication.lisp" :SOURCE-SHA256
   "3f867f54309b0a2985660dd8145b100eb097c1d7fdfcd917c61d73d082009109" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/publication.fasl"
   :FASL-SHA256
   "e07634ad54cbf826f4767e7bf8718a3bbc1f1aebedc3afc175d0e249acef139a")
  (:FILE "src/control/publication-read.lisp" :SOURCE-SHA256
   "cfb12232748e62d1edef6896389e8d54057951c058ee43d70dd346b10c5f582e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/publication-read.fasl"
   :FASL-SHA256
   "ab17d97f61ede2259b247027eb5a02a2f3141bc6674d47f363f5bb942ce4e280")
  (:FILE "src/control/prepare.lisp" :SOURCE-SHA256
   "1226996af2215e3ebf06265e48d43632a1642ccacd312fabd983c5f3bfa7536d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/prepare.fasl"
   :FASL-SHA256
   "c4a7cc3d01ad62d2fa049d70f7a529e7e05ff242fa52e1f24106d27ccf6fb84e")
  (:FILE "src/control/preflight.lisp" :SOURCE-SHA256
   "48326533ac0934cb3b1e3fc7657ef48f38912b6c08e9e38367301905f7711584" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/preflight.fasl"
   :FASL-SHA256
   "efbc30962ffe2b330d733e543b4f69fc4e257863916a13d5d028c8c81fd9f26a")
  (:FILE "src/control/package.lisp" :SOURCE-SHA256
   "c6ca23c7b0a8cea48bec2b7017482802f2078b0d58414c6708fbfe5f7d46377d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/package.fasl"
   :FASL-SHA256
   "3b115b56aedd0edc7fe0d2f84f5c579aac336d469d15c0bf6ccd75171c038273")
  (:FILE "src/control/dependency.lisp" :SOURCE-SHA256
   "f328344e4824fd53d03a0476b45fb87efada43ddee895e13afd76ac44413d128" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/dependency.fasl"
   :FASL-SHA256
   "f131232dcd9d6d7a6d715bbbbb4da4e75c11144cca40fc24a580c3a8e578ac55")
  (:FILE "src/control/build.lisp" :SOURCE-SHA256
   "1904e81a6cebbb178598a41e1b2283240fc21506781b1e31da407610ce0f519c" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/control/build.fasl"
   :FASL-SHA256
   "231dbb19313e60fbfa8c737c1e6ecacd9a92bbf6d61dfce9d242ee7179fa29aa")
  (:FILE "src/codec/utf8.lisp" :SOURCE-SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/utf8.fasl"
   :FASL-SHA256
   "d16f511acd938319335919111202692ec15e1ac9febcb3c76719812e1e3dd3a3")
  (:FILE "src/codec/package.lisp" :SOURCE-SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/package.fasl"
   :FASL-SHA256
   "8ebc7ed23a5781f30709e46731642294afd2b231d8d13576ee1dbfab4fcc5ee1")
  (:FILE "src/codec/cbor-write.lisp" :SOURCE-SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-write.fasl"
   :FASL-SHA256
   "61eecd1b94a5f0dcf5602046c5484d9d0facfc39b1c8f308a4c8ff42b9ffe0b8")
  (:FILE "src/codec/cbor-string-write.lisp" :SOURCE-SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-string-write.fasl"
   :FASL-SHA256
   "4aaa5256cc2050a53fad3375e9897f3b54237865ef111e8ed81188e276a470db")
  (:FILE "src/codec/cbor-space.lisp" :SOURCE-SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-space.fasl"
   :FASL-SHA256
   "773752e34fded79645cb9071eb0f779b3b3a10c09c43242aeab62cea525fdadb")
  (:FILE "src/codec/cbor-simple-write.lisp" :SOURCE-SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-simple-write.fasl"
   :FASL-SHA256
   "f807641ca33e28e5b558674d75b36698749d870a1e8fb8112d0e4cea317c425f")
  (:FILE "src/codec/cbor-scan.lisp" :SOURCE-SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-scan.fasl"
   :FASL-SHA256
   "6c281055cca54498cc7a597c63609dfe59312df5b71e3128ff3a951b1be7b33c")
  (:FILE "src/codec/cbor-scan-stack.lisp" :SOURCE-SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-scan-stack.fasl"
   :FASL-SHA256
   "db1aabe088771d1b3ef786815f87bb49f0fcfca5df237558d6536922ebc53ed3")
  (:FILE "src/codec/cbor-scan-minimal.lisp" :SOURCE-SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-scan-minimal.fasl"
   :FASL-SHA256
   "20b14c6f9d271d6f7d9030ceaf6107e68d5a307ddadea746f0933e12100a7e1b")
  (:FILE "src/codec/cbor-scan-items.lisp" :SOURCE-SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-scan-items.fasl"
   :FASL-SHA256
   "f47e17d0ee9a0a49a2f0904987f58ad597b8e60948a8903c376f234ee9611e1a")
  (:FILE "src/codec/cbor-scan-input.lisp" :SOURCE-SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-scan-input.fasl"
   :FASL-SHA256
   "f15d905d64793b23d6b33ac9fee6a14772ad78505402d146835ad89b7446d799")
  (:FILE "src/codec/cbor-package.lisp" :SOURCE-SHA256
   "f74f5d1cb0b71658aaeb36518530c2396d132a783cb58109788e434691acb503" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-package.fasl"
   :FASL-SHA256
   "b255237a778c34d3d9e13da27ed99361622242c11d89e54acfc6cf42b7299012")
  (:FILE "src/codec/cbor-minimal.lisp" :SOURCE-SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-minimal.fasl"
   :FASL-SHA256
   "db0ad942a305a7e172f8fdad05ad2af414f4340261101167bc5616c986627613")
  (:FILE "src/codec/cbor-header.lisp" :SOURCE-SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-header.fasl"
   :FASL-SHA256
   "9eba7fabe70d639181b2c06434860dc4a48d61ffb0da4bf9cc980ba8d19021a7")
  (:FILE "src/codec/cbor-float-write.lisp" :SOURCE-SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-float-write.fasl"
   :FASL-SHA256
   "ce088e81ec6dad6b24074beabd3d47976a47761c7967e3bc186d1e1fe615abb7")
  (:FILE "src/codec/cbor-float-narrow.lisp" :SOURCE-SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-float-narrow.fasl"
   :FASL-SHA256
   "b3b296023f64b2bdf14ae19ca4ab5005adb7a4ec6a57815a6517525d65efba25")
  (:FILE "src/codec/cbor-float-minimal.lisp" :SOURCE-SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-float-minimal.fasl"
   :FASL-SHA256
   "076baef8d88ce72759dc8f5e731d26918e4761d13dd3d1e6a1b8e34732e91dd7")
  (:FILE "src/codec/cbor-array-write.lisp" :SOURCE-SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-array-write.fasl"
   :FASL-SHA256
   "67a65e94969ddf5b24442279ce459630f44c395147d22643cd6343c161ec7eb4")
  (:FILE "src/codec/cbor-array-input.lisp" :SOURCE-SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/codec/cbor-array-input.fasl"
   :FASL-SHA256
   "6773f3b6cb53e4efc815db5851bb55b068c01d8103b54b1e22be2366baa403cf")
  (:FILE "src/cache/write.lisp" :SOURCE-SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/write.fasl"
   :FASL-SHA256
   "73c52f9cdb17e51eafbcf11402d5e88cc4001056206da5a065b4b0be983dbc4f")
  (:FILE "src/cache/types.lisp" :SOURCE-SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/types.fasl"
   :FASL-SHA256
   "c74a3b4e7e1288d69161b06fc39a6d7867904317921f375e3d6e41f5253b1375")
  (:FILE "src/cache/read.lisp" :SOURCE-SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/read.fasl"
   :FASL-SHA256
   "2318ecd73ea831428e5fef5fab675edf606c3f6c22d83a7497ed3abdae915c93")
  (:FILE "src/cache/package.lisp" :SOURCE-SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/package.fasl"
   :FASL-SHA256
   "3b1de5b46e4716eda31f37ced60ec32496ae5a6a15e61443cabb10c801ca2f88")
  (:FILE "src/cache/core.lisp" :SOURCE-SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/core.fasl"
   :FASL-SHA256
   "b906ab85d1d49d8f9dfc39295548af961e6186f839176f15a38311971e9aabd9")
  (:FILE "src/cache/clock.lisp" :SOURCE-SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/clock.fasl"
   :FASL-SHA256
   "65465a7ffc265045c814337421178b01a048685bfaa184d0a60c2f0288079d63")
  (:FILE "src/cache/build.lisp" :SOURCE-SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/cache/build.fasl"
   :FASL-SHA256
   "c4caad2e04e277216f175fad32a518d92f7aff8bdfd6c32632ab35ac7d024a1a")
  (:FILE "src/active/types.lisp" :SOURCE-SHA256
   "48fe584096fc253ef182ab428c1887e443af06d75aaa938df660c77e60b39bfb" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/active/types.fasl"
   :FASL-SHA256
   "a8997c4fb2bd8704302d5ed8716a51a6e60a6def519d4092ed476847c4a8877f")
  (:FILE "src/active/source.lisp" :SOURCE-SHA256
   "ff96fe360b46190ecc08ee9e05a813715dc3399054f93693f9309012aec6547d" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/active/source.fasl"
   :FASL-SHA256
   "7656ed462f53c53a3260dab17acbf445a2adb0fcda5ce464a5840e7462a195d6")
  (:FILE "src/active/prepare.lisp" :SOURCE-SHA256
   "7b45fb01132c45c9bec76f374edaa8de91ac6bb2d61ae5c359e1fa10c6346f53" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/active/prepare.fasl"
   :FASL-SHA256
   "2dba32768137d43498df2b980565ceacae82ef62507459ebec3666244c81b018")
  (:FILE "src/active/preflight.lisp" :SOURCE-SHA256
   "ef7b592daecc223d78cbcda138b5938abc01593b486482bec06f2721cfd955a2" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/active/preflight.fasl"
   :FASL-SHA256
   "0bd29c9db7fdca9bb645e6c45e10745d623d3811ea16964d9c739d165abb2f7d")
  (:FILE "src/active/package.lisp" :SOURCE-SHA256
   "4a6fa4187ef5d44aec4e65d57ee6d6046485f283cc9009c1d94263bee745fa3b" :FASL
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/isolatedtests/omit-seal-bytes/fasl/src/active/package.fasl"
   :FASL-SHA256
   "36b39b43f2b4e7e4d6294818a314686f0b0f80ac6eeb5305c880e373e5ba8206"))
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
 (("ARCDOCDB.GET.ACTIVE.TESTS"
   "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY"))
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
  "TEST-REQ-AFF-008-ACTIVE-PREFLIGHT-SEAL-BYTE-BOUNDARY")
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
   "25be106b3d2c72b210c80d46bef7b83bea7a1db589d185d228992402f4dc0b81")
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
 "b82c3f88ccfaa2740ad723d84138ef92a71181b31284b1f6280964bb8d6c77c4"
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
   "25be106b3d2c72b210c80d46bef7b83bea7a1db589d185d228992402f4dc0b81")
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
