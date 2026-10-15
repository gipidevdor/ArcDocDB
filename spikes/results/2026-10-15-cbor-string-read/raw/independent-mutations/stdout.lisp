(:SCHEMA-VERSION 1 :KIND :INDEPENDENT-STRING-MUTATION-READING :STATUS :OK
 :CHECKS 4791 :SOURCE-PINS 38 :COPIES 9 :WHOLE-SOURCE-COMPARISONS 342
 :BASELINE-TESTS 17 :MUTATIONS-DETECTED 8 :RESULTS
 ((:NAME "baseline" :COMPILED 38 :CLASSIFICATION :OK :EXIT-CODE 0 :SIGNAL NIL
   :TESTS-PASSED 17 :FAILED-TEST NIL :CHANGED-FILES NIL :TEXT-FRAGMENTS 0
   :STDERR-BYTES 777)
  (:NAME "major-permissive" :COMPILED 38 :CLASSIFICATION :DETECTED :EXIT-CODE 1
   :SIGNAL NIL :TESTS-PASSED 7 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-TYPE-PRECEDES-FIT-FOR-EVERY-OTHER-MAJOR"
   :CHANGED-FILES ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1
   :STDERR-BYTES 0)
  (:NAME "skip-utf8" :COMPILED 38 :CLASSIFICATION :DETECTED :EXIT-CODE 1
   :SIGNAL NIL :TESTS-PASSED 12 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-UTF8-REASONS-AND-ABSOLUTE-PAYLOAD-OFFSETS"
   :CHANGED-FILES ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1
   :STDERR-BYTES 0)
  (:NAME "next-is-end" :COMPILED 38 :CLASSIFICATION :DETECTED :EXIT-CODE 1
   :SIGNAL NIL :TESTS-PASSED 0 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS" :CHANGED-FILES
   ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1 :STDERR-BYTES 0)
  (:NAME "ignore-requested-budget" :COMPILED 38 :CLASSIFICATION :DETECTED
   :EXIT-CODE 1 :SIGNAL NIL :TESTS-PASSED 5 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-BYTE-LIMIT-DOMAIN-AND-PREFLIGHT-PRECEDENCES"
   :CHANGED-FILES ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1
   :STDERR-BYTES 0)
  (:NAME "start-is-zero" :COMPILED 38 :CLASSIFICATION :DETECTED :EXIT-CODE 1
   :SIGNAL NIL :TESTS-PASSED 0 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS" :CHANGED-FILES
   ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1 :STDERR-BYTES 0)
  (:NAME "extra-fourth-nil" :COMPILED 38 :CLASSIFICATION :DETECTED :EXIT-CODE 1
   :SIGNAL NIL :TESTS-PASSED 0 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS" :CHANGED-FILES
   ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 2 :STDERR-BYTES 0)
  (:NAME "skip-header-minimality" :COMPILED 38 :CLASSIFICATION :DETECTED
   :EXIT-CODE 1 :SIGNAL NIL :TESTS-PASSED 3 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-CONCATENATION-AND-ZERO-LENGTH-PAYLOAD-FRONTIERS"
   :CHANGED-FILES ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1
   :STDERR-BYTES 0)
  (:NAME "ignore-high-length-word" :COMPILED 38 :CLASSIFICATION :DETECTED
   :EXIT-CODE 1 :SIGNAL NIL :TESTS-PASSED 10 :FAILED-TEST
   "TEST-REQ-CBR-009-STRING-U64-LENGTH-AND-LOW-WORD-FIT-BEFORE-PAYLOAD"
   :CHANGED-FILES ("src/codec/cbor-string-read.lisp") :TEXT-FRAGMENTS 1
   :STDERR-BYTES 0))
 :PHYSICAL-FILES-OBSERVED 424 :SHA256-AND-METADATA-BEFORE-AFTER :STABLE
 :WRAPPER-SOURCES 1015 :WRAPPER-STDERR-BYTES 0 :OBSERVATIONS
 ((:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085241-command-38293-0/report.lisp")
   :BYTES 447247 :SHA256
   "f9d46043afd1fd602ee67a9dacfeec94ba55bed209f3b49b522f8539976961d0"
   :WRITE-DATE 4001085380)
  (:PATH
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/catalog.lisp")
   :BYTES 6833 :SHA256
   "be1c765c4bc76b9655afa04320313d92dc7c804abc91f9177698468b29069c27"
   :WRITE-DATE 4001085031)
  (:PATH
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085031)
  (:PATH
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/run.lisp")
   :BYTES 18699 :SHA256
   "f114ba0676996050dfc66d5505b21b2c1ee07ada4a0f99d7bcf5b0112cd90a9a"
   :WRITE-DATE 4001085178)
  (:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/plan.lisp")
   :BYTES 5877 :SHA256
   "3b9c154353cdb96bfaa76b778557ea3d4036ab3fc0a8078b309df043a8ed2ab0"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-string-read.lisp")
   :BYTES 3739 :SHA256
   "8cf5bda7cb0cb0b68460fd6aaa54a7d7e8c5c78c82015f4d851699792b4a5a35"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/stderr.log")
   :BYTES 777 :SHA256
   "16997cc687a104d88acb52df504c9241dd89fc56dc3133c4b00036450006719f"
   :WRITE-DATE 4001085312)
  (:PATH
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/stdout.lisp")
   :BYTES 2726 :SHA256
   "a2bbe3bf3557db85e284769962c3bc23db1397246538ef15c552c299c15a6485"
   :WRITE-DATE 4001085315)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/catalog.lisp")
   :BYTES 6833 :SHA256
   "be1c765c4bc76b9655afa04320313d92dc7c804abc91f9177698468b29069c27"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/plan.lisp")
   :BYTES 5877 :SHA256
   "5afb91a4847a47fa5b5d39f109752533b3ddf05f46a1826e91b52e3461e8fbcc"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-string-read.lisp")
   :BYTES 3748 :SHA256
   "36b70a69e220f01958d50924cdc5182ae5185a1cc1b13fb5cbf61ad169a8fb69"
   :WRITE-DATE 4001085290)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085355)
  (:PATH
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/stdout.lisp")
   :BYTES 1736 :SHA256
   "3e9f078680ae0b4fc99aec28de26b386b1abeb8baa5159afd1d8d04bd48bb7f2"
   :WRITE-DATE 4001085358)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085305)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/plan.lisp")
   :BYTES 5877 :SHA256
   "06cc7a39f9c2c376696e39a73537e98787beb617ee9173a5a54aa689ff274076"
   :WRITE-DATE 4001085305)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-string-read.lisp")
   :BYTES 3747 :SHA256
   "11bc24d8992dbc5d5e84ea239fe5abb3d8d7fcd43b8690ba053e7bcb57e56fa6"
   :WRITE-DATE 4001085302)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085368)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/stdout.lisp")
   :BYTES 2427 :SHA256
   "11de799f0cf1bfd3d3562e13f91621a0ebdb5968102135a4efb88dfca2502528"
   :WRITE-DATE 4001085372)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/plan.lisp")
   :BYTES 5877 :SHA256
   "999e9b4e6174fe51d63fc5948d23a8c6f8ee781b8d1068331803a81d37719333"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-string-read.lisp")
   :BYTES 3751 :SHA256
   "6b5ba9eaf64d9c0ab27f122ead7d7d0d85f4fc962294a9febafe1389ad6874fc"
   :WRITE-DATE 4001085276)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085341)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/stdout.lisp")
   :BYTES 2089 :SHA256
   "8b9d510991fbe565663afb08bb9065ce025cbb34aacd0d7aed222819e67b658b"
   :WRITE-DATE 4001085345)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/plan.lisp")
   :BYTES 5877 :SHA256
   "5255d5e6b0fdb480d1d774d168b06d7d601d993130475d5dbcc6c4574384335f"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-string-read.lisp")
   :BYTES 3685 :SHA256
   "a0e2686f18c1d592279494631f5e03b42b35eb44150b1ca61890deb77cdc87f2"
   :WRITE-DATE 4001085257)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085318)
  (:PATH
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/stdout.lisp")
   :BYTES 2219 :SHA256
   "fd7136bda48bd4e0213486c0402648db2a2b93d3895f7ca228cd535cb5b855be"
   :WRITE-DATE 4001085322)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085254)
  (:PATH
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/plan.lisp")
   :BYTES 5877 :SHA256
   "1a667f9bf3375da09696659307ea95132978509a5a85fef6df92ff7189d32c06"
   :WRITE-DATE 4001085272)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-string-read.lisp")
   :BYTES 3740 :SHA256
   "8d8eedad9e229c5743ef12af0a21bdeb492a1e3acea3343862518be7e958fd39"
   :WRITE-DATE 4001085270)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085333)
  (:PATH
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/stdout.lisp")
   :BYTES 1947 :SHA256
   "a90802d9248ed0f0d620919a8cc01b2c43e8d44b96df73cc76b92917c3559c9f"
   :WRITE-DATE 4001085337)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085267)
  (:PATH
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/report.lisp")
   :BYTES 228908 :SHA256
   "835a2ac5648998b37a366ab231e0264ae70302986f602a7f68c5d95ba61f3121"
   :WRITE-DATE 4001085379)
  (:PATH
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/run.lisp")
   :BYTES 18699 :SHA256
   "f114ba0676996050dfc66d5505b21b2c1ee07ada4a0f99d7bcf5b0112cd90a9a"
   :WRITE-DATE 4001085247)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/plan.lisp")
   :BYTES 5877 :SHA256
   "f8d5943f5a9b060b18765ab721b7f038bead5a388d859eadd8bbfefac7ece9cb"
   :WRITE-DATE 4001085299)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-string-read.lisp")
   :BYTES 3732 :SHA256
   "3c418a20849c963c64b9fe3eb68fbf1125d9a1a64e09d2d307ea9972dc6587e6"
   :WRITE-DATE 4001085296)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085361)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/stdout.lisp")
   :BYTES 1943 :SHA256
   "0d2c963b238f4ff104894e5836ff0ce59a9680c948fed6ad945240dfe4ed2f90"
   :WRITE-DATE 4001085365)
  (:PATH
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085293)
  (:PATH
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085266)
  (:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/plan.lisp")
   :BYTES 5877 :SHA256
   "526691a6bac47088627ab676cd19c614542938aa22ccbd6b9f2ddedc82993d24"
   :WRITE-DATE 4001085266)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-string-read.lisp")
   :BYTES 3514 :SHA256
   "7c6bc78845b39e1d89b871cef0afc8713321fee082c2a2a97627498966561043"
   :WRITE-DATE 4001085263)
  (:PATH
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085325)
  (:PATH
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/stdout.lisp")
   :BYTES 2579 :SHA256
   "443b6b2f477bdd315949d3325e9954780f53e0b80c9a79f6b4476ef198b50adc"
   :WRITE-DATE 4001085329)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085260)
  (:PATH
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/plan.lisp")
   :BYTES 5877 :SHA256
   "ebbd2c3d54d4ceb7b3dc4b043aea50dab998ba724fcb8f8d4178bce83e5f0d5e"
   :WRITE-DATE 4001085287)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-string-read.lisp")
   :BYTES 3723 :SHA256
   "c87febe4ff210dc2c4bc2b8da456d6730240051f248d225c6b99d0c050a5837e"
   :WRITE-DATE 4001085284)
  (:PATH
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
   :WRITE-DATE 4001085348)
  (:PATH
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/stdout.lisp")
   :BYTES 1703 :SHA256
   "55555aa5fa23e94a571e5d90970428bf20da713c466f9aefe29bf6964c54378f"
   :WRITE-DATE 4001085352)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001085280)
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e"
   :WRITE-DATE 4001084454)
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-string-read.lisp")
   :BYTES 3739 :SHA256
   "8cf5bda7cb0cb0b68460fd6aaa54a7d7e8c5c78c82015f4d851699792b4a5a35"
   :WRITE-DATE 4001084781)
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96"
   :WRITE-DATE 4001084592)
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b"
   :WRITE-DATE 4001084592)
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084"
   :WRITE-DATE 4001084592)
  (:PATH
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a"
   :WRITE-DATE 4001076817)
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :WRITE-DATE 4001076817))
 :LIMITS
 (:DATA-ONLY :READ-EVAL-NIL :EOF :NO-PRODUCT-LOAD-COMPILE-OR-EXECUTION
  :NO-NEW-MUTATION-RUN :ALL-38-FILES-COMPILED-PER-CHILD
  :NOMINAL-FAILURE-AND-EXACT-PREFIX-NOT-DIAGNOSTIC-SUBSTRINGS
  :ONE-SEMANTIC-CHANGE-PER-MUTANT :EXTRA-ARITY-HAS-TWO-DECLARED-TEXT-FRAGMENTS
  :COMPILER-NOTES-ALLOWED-AND-PRESERVED :PRIVATE-FASL-PRESENCE-WITHOUT-LOADING
  :NO-C1-OR-MCDC-PROMOTION))
