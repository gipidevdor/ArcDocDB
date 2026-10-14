(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :BASE
 "ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e" :PROCESSES
 ((:NAME "publisher-selftest" :ID "4000996071-command-39309-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996071-command-39309-0/")
   :PUBLISHED-DIRECTORY
   #A((73) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-begin/processes/publisher-selftest/"))
  (:NAME "coverage-reader" :ID "4000996086-command-40256-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996086-command-40256-0/")
   :PUBLISHED-DIRECTORY
   #A((70) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/processes/coverage-reader/"))
  (:NAME "selftest" :ID "4000996086-command-40255-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996086-command-40255-0/")
   :PUBLISHED-DIRECTORY
   #A((63) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/processes/selftest/"))
  (:NAME "coverage" :ID "4000996086-command-40257-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996086-command-40257-0/")
   :PUBLISHED-DIRECTORY
   #A((63) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/processes/coverage/"))
  (:NAME "benchmark" :ID "4000996125-command-41073-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996125-command-41073-0/")
   :PUBLISHED-DIRECTORY
   #A((64) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/processes/benchmark/"))
  (:NAME "check-core" :ID "4000996069-command-39211-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996069-command-39211-0/")
   :PUBLISHED-DIRECTORY
   #A((65) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/processes/check-core/")))
 :DATA
 ((:NAME "coverage-audit" :SOURCE
   #A((119) BASE-CHAR
      . "/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/coverage-attempt-01/coverage-audit.lisp")
   :PUBLISHED
   #A((83) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-begin/data/coverage-audit/coverage-audit.lisp"))
  (:NAME "begin-coverage-audit" :SOURCE
   #A((128) BASE-CHAR
      . "/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :PUBLISHED
   #A((98) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-begin/data/begin-coverage-audit/coverage-dispatch-audit.lisp"))
  (:NAME "benchmark" :SOURCE
   #A((108) BASE-CHAR
      . "/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/bench-attempt-01/report.lisp")
   :PUBLISHED
   #A((70) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/data/benchmark/report.lisp")))
 :CAMPAIGNS
 ((:NAME "check-core-spikes" :SOURCE-DIRECTORY
   #A((94) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996306-check-44850-0/")
   :PUBLISHED-DIRECTORY
   #A((72) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/")
   :FILES
   ((:RELATIVE-PATH "SPK-01.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-01.lisp")
     :BYTES 27228 :SHA256 "e63ea9285a1103c6326bf160ebea80be1103fa76d99a52746233d9a491c57b67"
     :GIT-BLOB "9e0863ff2464d394077ef9010a295204a71f4bc2")
    (:RELATIVE-PATH "SPK-02.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-02.lisp")
     :BYTES 1607 :SHA256 "02e024e057693b684c47d72334f297179f7888116599bec32bc1833033f7765d"
     :GIT-BLOB "e4634b07489a69075f6b430f5cffdceea0e1a61e")
    (:RELATIVE-PATH "SPK-03.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-03.lisp")
     :BYTES 3632 :SHA256 "0fbbc1f10c9064fc2693505b3029ab6f8a3b414670b8baedfcd6121e01594252"
     :GIT-BLOB "d96741736fa83b2f978289b158873e9ed9fc4005")
    (:RELATIVE-PATH "SPK-04.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-04.lisp")
     :BYTES 6752 :SHA256 "34aaa8d84d70edeadaae6d77f51a77b1d79e96160f9bec953ff0d6aa7c40ea3f"
     :GIT-BLOB "59feacc2335df2a132a51c4755238b07699ac711")
    (:RELATIVE-PATH "SPK-05.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-05.lisp")
     :BYTES 10168 :SHA256 "fa021b93d5d293451859ab01931fe92f5f7bd4930ffd9f61728c8c580c0b8d05"
     :GIT-BLOB "b770638f58c4206647797288758525cb73c5c901")
    (:RELATIVE-PATH "SPK-06.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-06.lisp")
     :BYTES 24066 :SHA256 "89a4bae056fc35de469f737ada54e24486a76c3494e76963369ca49051f996e8"
     :GIT-BLOB "18bb7b98eba58766f3273ebdd4442b1ab93cc781")
    (:RELATIVE-PATH "SPK-07.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-07.lisp")
     :BYTES 318 :SHA256 "1a951203c3d3df6ee396fb6243bf46cdc5e907a78f4d3b2f657dad141314298e"
     :GIT-BLOB "7ba61cad9885a257866d1b628b4561215a394e18")
    (:RELATIVE-PATH "SPK-07.lisp.gz" :PATH
     #A((86) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-07.lisp.gz")
     :BYTES 410661 :SHA256 "fa25701d8a4e7b702f4cbcec925ea9604d68b107188c13bc7509f32f64f1ffb6"
     :GIT-BLOB "dd9c43c173f0b8ebad1d167ef62281c5365698be")
    (:RELATIVE-PATH "SPK-08.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-08.lisp")
     :BYTES 291712 :SHA256 "5b5fced2302e8c56017994dc398720dba632219e98a58112147c58abab1c2fcd"
     :GIT-BLOB "6afe032b78526c68c29874b2714c25d5b9dc25b6")
    (:RELATIVE-PATH "SPK-09.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-09.lisp")
     :BYTES 2472 :SHA256 "527045505cadc555c36834c6368557c85a02bfed8257621c935d498c8f63aede"
     :GIT-BLOB "1afa2dce61ac45f9aa60722e2801778afdad179b")
    (:RELATIVE-PATH "SPK-10.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/SPK-10.lisp")
     :BYTES 22977 :SHA256 "f226795320c56c0b283e627ff60a1f9522a01c5fd98fccee1c7714cd608ce160"
     :GIT-BLOB "c78b9ecd0f5c49db691db2f569591a42d0c66eb1")
    (:RELATIVE-PATH "conservazione.lisp" :PATH
     #A((90) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/conservazione.lisp")
     :BYTES 2269 :SHA256 "164d5f8a099c4a574bc305a3a312027e7658a2f3fe3c13478b9b0da4f02c1006"
     :GIT-BLOB "2998f228249485417c388d2fdb344a52a9df7ed0")
    (:RELATIVE-PATH "report.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/report.lisp")
     :BYTES 318 :SHA256 "76485480cd43678d143dac335dc3e9663a46d9615ea744f582b41f4fc99a09c8"
     :GIT-BLOB "5614e892b527729ee4deb5f37affe1d42f4782e6")
    (:RELATIVE-PATH "report.lisp.gz" :PATH
     #A((86) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-begin/campaigns/check-core-spikes/report.lisp.gz")
     :BYTES 466863 :SHA256 "4362553c5a3745d9db125081d89b5eee5faca4aa77546c6ded3e91e739ae9353"
     :GIT-BLOB "6e481cc0d2837019ff7cc98351b7e37d20fcbb9c"))))
 :COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST)
 :LIMITS
 (:ORIGINAL-PROCESS-REPORT-AND-CONSERVATION :NO-STATUS-PROMOTION :ONE-DIRECTORY-PER-PROCESS
  :ORIGINAL-GZIP-PAYLOAD-BASENAME :ALL-RECURSIVE-UTF8-DEVELOPMENT-SOURCES :ONLY-FASL-EXCLUDED))
