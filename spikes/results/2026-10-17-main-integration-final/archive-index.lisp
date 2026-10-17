(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "command-0" :RECORD-PATH "processes/command-0/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-1" :RECORD-PATH "processes/command-1/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/selftest-1792234524-1245"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-2" :RECORD-PATH "processes/command-2/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001222737-command-92001-0/report.lisp")
    #A((70) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-inputs-v2.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-3" :RECORD-PATH "processes/command-3/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "git") #A((4) BASE-CHAR . "diff")
    #A((11) BASE-CHAR . "--exit-code")
    #A((40) BASE-CHAR . "c9e97fd0b124f0dfce5d42e21d9d1f15407b6a2a")
    #A((4) BASE-CHAR . "HEAD") #A((2) BASE-CHAR . "--")
    #A((56) BASE-CHAR
       . "spikes/results/2026-10-16-main-integration-preservation/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-4" :RECORD-PATH "processes/command-4/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001222737-command-92001-0/report.lisp")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-inputs.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-5" :RECORD-PATH "processes/command-5/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001222737-command-92001-0/report.lisp")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-inputs.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((76) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/final-archive-manifest-v2.lisp")
   :BYTES 8997 :SHA256
   "5e3e2dced183c7f5cd1da4b3862b5447a110b27555ef8080863ba58e8b6f5d76")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/command-0/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001222737-command-92001-0/conservazione.lisp")
   :BYTES 1635 :SHA256
   "624223e7ceec588c2d73ba726ccb9588ab5cc67cce5d4c0290b85980e51577f2")
  (:PATH "processes/command-0/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001222737-command-92001-0/report.lisp")
   :BYTES 317 :SHA256
   "bab170ac0a82e8da5d393d86f67023c3662db9bfc25f51f22240603c42ee345a")
  (:PATH "processes/command-0/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001222737-command-92001-0/report.lisp.gz")
   :BYTES 259311 :SHA256
   "82f3cf6cd02fbca5437e76c3740a5c201026a6e43e6a16a1d943925b11a36de7")
  (:PATH "processes/command-1/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223325-command-1248-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "31ff5d276922139e18db790e7698310ee254f01a071dc4585c1dfcfa94b39eb7")
  (:PATH "processes/command-1/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223325-command-1248-0/report.lisp")
   :BYTES 262412 :SHA256
   "9e26879af19514b4ff60610133d80f5a9115d06c148cc2d84ddab4e69116eb18")
  (:PATH "processes/command-2/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223472-command-2355-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "b97ee3d9e7dc97055a230e5b43ec9290668b8be12bd5bf6d37ebd830d5f418bc")
  (:PATH "processes/command-2/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223472-command-2355-0/report.lisp")
   :BYTES 262006 :SHA256
   "a6679bdcfeeffa3471d8d6b00e77bcd2e388597ca21186e7f6cf49f5233029f5")
  (:PATH "processes/command-3/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001222600-command-90974-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "1aafb9a256c9bd7c7e90198a9b15e29adc78b8717011a3101c6b120397b8e5fa")
  (:PATH "processes/command-3/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001222600-command-90974-0/report.lisp")
   :BYTES 261575 :SHA256
   "7b630b528323cd50097b43170a574e9d109940aa05a64a4867990cd8ed228a20")
  (:PATH "processes/command-4/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223367-command-1601-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "2c0eccccab2852e9cc997940d33b2f7607f16219e26648215b3181ae8054ea04")
  (:PATH "processes/command-4/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223367-command-1601-0/report.lisp")
   :BYTES 272316 :SHA256
   "f4491b7d2a70f2083664092114a526562e5ebc232a07503fd271278e2c3d18a4")
  (:PATH "processes/command-5/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223411-command-1950-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "1d72dd3da0cd91cbc0dbc6d51c8fe0b7b58a65baefbc75a7c845b3a867568844")
  (:PATH "processes/command-5/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223411-command-1950-0/report.lisp")
   :BYTES 262004 :SHA256
   "82c8c04cec346cb69fb91e09be11442066a0feb2ad976c461595e217f78825f6")
  (:PATH "raw/ci-self-test/boundaries.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/boundaries.lisp")
   :BYTES 617 :SHA256
   "e3dde1942bea1dc6c4d6312abb8a4c4c800eb4e22260e490536ab03c6a0bd84d")
  (:PATH "raw/ci-self-test/conditions.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions.lisp")
   :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "raw/ci-self-test/conditions/catalog-positive/tests.events.lisp"
   :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/catalog-positive/tests.events.lisp")
   :BYTES 1576 :SHA256
   "c32c0260d9c6b347d99b6f99f75589310e6a202477fbe27c72b6b5224f1d60a7")
  (:PATH "raw/ci-self-test/conditions/catalog-positive/tests.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/catalog-positive/tests.lisp")
   :BYTES 900 :SHA256
   "6553fc916c170694d653ec5785a7682159b6085ef37be9adb59ecf2051ee9a83")
  (:PATH "raw/ci-self-test/conditions/child-timeout/child-result.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/child-timeout/child-result.lisp")
   :BYTES 107 :SHA256
   "baefe657d44489e0980bcde22079e3906397ee392b9580640d1b50cbd7914d54")
  (:PATH "raw/ci-self-test/conditions/conditions-self-test.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/conditions-self-test.lisp")
   :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "raw/ci-self-test/conditions/ordinary-error/tests.events.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/ordinary-error/tests.events.lisp")
   :BYTES 1311 :SHA256
   "5e786caab06ea7b50c63d669bf91532c90c1ede097a46612c86082916d402cad")
  (:PATH "raw/ci-self-test/conditions/ordinary-error/tests.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/ordinary-error/tests.lisp")
   :BYTES 967 :SHA256
   "a20fdfd973ce98cf9b45f5cbf81c28da9fab57b6b63abf77ea16628d839dc36b")
  (:PATH "raw/ci-self-test/conditions/registered-timeout/tests.events.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/registered-timeout/tests.events.lisp")
   :BYTES 1311 :SHA256
   "24873d0570be6403e1d3aa8e40587f171fa399a173c0c32f448fc6f5a7786535")
  (:PATH "raw/ci-self-test/conditions/registered-timeout/tests.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/registered-timeout/tests.lisp")
   :BYTES 966 :SHA256
   "f0e11cb0db46c7b60956fa16fd7030ae238f6f26b4d4c1af3c6153a35a5a3d5e")
  (:PATH "raw/ci-self-test/conditions/runner-timeout/tests.events.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/runner-timeout/tests.events.lisp")
   :BYTES 998 :SHA256
   "33d62cf5d438d68cdd98d29e0cec4e4ef327e7c18a5ca4c8e4a39c4cae1c169a")
  (:PATH "raw/ci-self-test/conditions/runner-timeout/tests.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/conditions/runner-timeout/tests.lisp")
   :BYTES 956 :SHA256
   "c562bb4ccbe7d11d8b7f07c0631d8e20bf82c22caaea2493b326720cc08ddb51")
  (:PATH "raw/ci-self-test/data.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/data.lisp")
   :BYTES 3017 :SHA256
   "d4ef2eab0385ce32c91ba6b156c856ecffe25c39765c792bd8a56f27cf0b073f")
  (:PATH "raw/ci-self-test/measure.lisp" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "raw/ci-self-test/report.lisp" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/report.lisp")
   :BYTES 548 :SHA256
   "03392cae9da231321da47ee426749b9640cb58fa9dc8ef383201fa0412b0f293")
  (:PATH "raw/ci-self-test/tests.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/tests.lisp")
   :BYTES 2085 :SHA256
   "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e")
  (:PATH "raw/ci-self-test/workflow.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/ci/selftest-1792234524-1245/workflow.lisp")
   :BYTES 27556 :SHA256
   "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269")
  (:PATH "raw/integration-inputs-before-counter-fix.lisp" :SOURCE
   #A((75) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-inputs.lisp")
   :BYTES 84817 :SHA256
   "1ebefb78f338b66c277b4f46a43fbe3a0cfdd7e79cfe4aa445b03da25af0c306")
  (:PATH "raw/integration-inputs.lisp" :SOURCE
   #A((78) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-inputs-v2.lisp")
   :BYTES 84817 :SHA256
   "1ebefb78f338b66c277b4f46a43fbe3a0cfdd7e79cfe4aa445b03da25af0c306")
  (:PATH "raw/prepare-final-archive-before-counter-fix.lisp.txt.txt" :SOURCE
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/prepare-final-archive-before-counter-fix.lisp.txt")
   :BYTES 3113 :SHA256
   "7cf98e22ea0b472b400cabc35aed95898a32ae2d08c39d743a6842aba82aeed6")
  (:PATH "raw/prepare-final-archive.lisp.txt" :SOURCE
   #A((72) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/prepare-final-archive.lisp")
   :BYTES 3475 :SHA256
   "58fcd3a940c64ad7626ea83ecfed33627d0b070710710199f2a1227ced503c81")
  (:PATH "raw/spikes-0/SPK-01.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "de86a055dbe4ccefcc6a9bd52779b27c58300051ff2065ffae71453a7126f5fd")
  (:PATH "raw/spikes-0/SPK-02.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "2d8dec1b5a4643b614ceb3ebf235822e84b408c6204f3deb07c8b98aa3f3c29b")
  (:PATH "raw/spikes-0/SPK-03.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-03.lisp")
   :BYTES 3596 :SHA256
   "3957890fff245ea41aeeadbc8600218ed713fc4745de0b84135962dfd0d6a23d")
  (:PATH "raw/spikes-0/SPK-04.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "ad44e2cd56e96b8a22b250af42cbd19f7394649f8be312b06d3c724299ed93b5")
  (:PATH "raw/spikes-0/SPK-05.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-05.lisp")
   :BYTES 10170 :SHA256
   "5838db9cc7ca573afc362160e679a1e00aa653e04dcb07b5e5e184061dcec0a4")
  (:PATH "raw/spikes-0/SPK-06.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-06.lisp")
   :BYTES 24100 :SHA256
   "0aa7f87d91b6d2d0fd62e0991241ba8fae20528aa7a74815b57e02699b4218c5")
  (:PATH "raw/spikes-0/SPK-07.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "5df87cca3ccbfec21b22c33e67bab59c3c04fca8a3c804fc2efbb4ce9c825b7c")
  (:PATH "raw/spikes-0/SPK-07.lisp.gz" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-07.lisp.gz")
   :BYTES 410640 :SHA256
   "7f47185cc183ceb61f5d610c9fc082f38c6613eeb7e4b77ee7d36010d8a31a7b")
  (:PATH "raw/spikes-0/SPK-08.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-08.lisp")
   :BYTES 291711 :SHA256
   "a3753d7e0351d6c033a2c7c76f1274fe923df3918255ae19cd1215277d335c37")
  (:PATH "raw/spikes-0/SPK-09.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "cd653df21553fc75d26dbcaa64cabb5421956058d16734af540f803484f5130f")
  (:PATH "raw/spikes-0/SPK-10.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-10.lisp")
   :BYTES 22976 :SHA256
   "7291be4b3a2b10e18b42d505074b2a119348ea126e94933b72b9b057bafb7f20")
  (:PATH "raw/spikes-0/SPK-11.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/SPK-11.lisp")
   :BYTES 15749 :SHA256
   "1d24055d5b176066fbf435a9783078cebc7cb4525e4a899df499e81ee9f8d6d4")
  (:PATH "raw/spikes-0/conservazione.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/conservazione.lisp")
   :BYTES 2167 :SHA256
   "328ce6a40813aa6d6cbd22be3872d86097213d17d6148bae9b80d46b7ab7dc5f")
  (:PATH "raw/spikes-0/report.lisp" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/report.lisp")
   :BYTES 318 :SHA256
   "f78758296ef5a1744f386b3c2c054f2f4ffbc81da5ce97f27bcec78aed2daa00")
  (:PATH "raw/spikes-0/report.lisp.gz" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001223281-check-624-0/report.lisp.gz")
   :BYTES 469434 :SHA256
   "14e6065b38ec8cb920c6c035723192b097e3abb82f553d8106ad576d38826293")
  (:PATH "raw/verify-final-integration-before-counter-fix.lisp.txt.txt" :SOURCE
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration-before-counter-fix.lisp.txt")
   :BYTES 4690 :SHA256
   "1019151c75a7e8d2651c64f143b33b38a9ab2e06c85a3555bf83e1c00a9587fe")
  (:PATH "raw/verify-final-integration-before-fix.lisp.txt.txt" :SOURCE
   #A((90) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration-before-fix.lisp.txt")
   :BYTES 4691 :SHA256
   "fdedfd38bdf239a078a63c297f8e210cbc28d91e3ad1bff6c95d755e97eff5bd")
  (:PATH "raw/verify-final-integration.lisp.txt" :SOURCE
   #A((75) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
   :BYTES 4729 :SHA256
   "ea82728f8d16b582ead37125a779a1d8b1ab21a55e424304e3e0904f620b198e")
  (:PATH "report.md" :SOURCE
   #A((73) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/final-integration-report.md")
   :BYTES 4996 :SHA256
   "bc96a5c966f0ece683be9c8052d81a37e88ac638f2ea847b59c9f6436a68fa0c"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
