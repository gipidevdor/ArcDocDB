(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :BASE
 "5be241d8f295e3c82df06e75c9b12e0bf75eb202" :PROCESSES
 ((:NAME "publisher-selftest" :ID "4001073020-command-38578-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38578-0/")
   :PUBLISHED-DIRECTORY
   #A((72) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/publisher-selftest/"))
  (:NAME "coverage-reader" :ID "4001073020-command-38579-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38579-0/")
   :PUBLISHED-DIRECTORY
   #A((69) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/coverage-reader/"))
  (:NAME "selftest" :ID "4001073020-command-38582-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38582-0/")
   :PUBLISHED-DIRECTORY
   #A((62) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/selftest/"))
  (:NAME "coverage" :ID "4001073032-command-39128-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073032-command-39128-0/")
   :PUBLISHED-DIRECTORY
   #A((62) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/coverage/"))
  (:NAME "benchmark" :ID "4001073141-command-45181-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073141-command-45181-0/")
   :PUBLISHED-DIRECTORY
   #A((63) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/benchmark/"))
  (:NAME "check-core" :ID "4001073020-command-38577-0" :SOURCE-DIRECTORY
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38577-0/")
   :PUBLISHED-DIRECTORY
   #A((64) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/check-core/"))
  (:NAME "integrated-build" :ID "4001073480-command-67324-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073480-command-67324-0/")
   :PUBLISHED-DIRECTORY
   #A((70) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/processes/integrated-build/")))
 :DATA
 ((:NAME "coverage-audit" :SOURCE
   #A((117) BASE-CHAR
      . "/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-audit.lisp")
   :PUBLISHED
   #A((82) BASE-CHAR
      . "spikes/results/2026-10-15-pool-worker-step/data/coverage-audit/coverage-audit.lisp"))
  (:NAME "step-coverage-audit" :SOURCE
   #A((126) BASE-CHAR
      . "/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :PUBLISHED
   #A((96) BASE-CHAR
      . "spikes/results/2026-10-15-pool-worker-step/data/step-coverage-audit/coverage-dispatch-audit.lisp"))
  (:NAME "benchmark" :SOURCE
   #A((106) BASE-CHAR
      . "/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/bench-attempt-01/report.lisp")
   :PUBLISHED
   #A((69) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/data/benchmark/report.lisp")))
 :CAMPAIGNS
 ((:NAME "check-core-spikes" :SOURCE-DIRECTORY
   #A((93) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073416-check-63996-0/")
   :PUBLISHED-DIRECTORY
   #A((71) BASE-CHAR . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/")
   :FILES
   ((:RELATIVE-PATH "SPK-01.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-01.lisp")
     :BYTES 27223 :SHA256 "aecd2c75b1d9b1e40d5a7c1bfcc53e032d33ea587b5d5a4d96a3269ea1119866"
     :GIT-BLOB "14ede8eb27c6da1c090cc9d81f06038d514a7a70")
    (:RELATIVE-PATH "SPK-02.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-02.lisp")
     :BYTES 1607 :SHA256 "21655777ccb219de10e61c8988b42a897c2872ec97e20d3219e0156105a28e50"
     :GIT-BLOB "07494949e1c9abbbace2713b09b45f3873888092")
    (:RELATIVE-PATH "SPK-03.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-03.lisp")
     :BYTES 3630 :SHA256 "47172ab8b89002b30b13c0617a606d0b61be856b6e0dff1148addcdff9a03547"
     :GIT-BLOB "bd565076c41865bbf472c4e80a68a018c19507f7")
    (:RELATIVE-PATH "SPK-04.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-04.lisp")
     :BYTES 6752 :SHA256 "a686c04a46982a451c0a74a2fe27b85478a164790875202f71cbd84ed25133d7"
     :GIT-BLOB "1be6aa89486793b08b1fbe036972e4dbe15e9ec5")
    (:RELATIVE-PATH "SPK-05.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-05.lisp")
     :BYTES 10165 :SHA256 "ff743e71ddfcdfb20457a5f772caa311bb310b4c4f982472dc62896d420c9ec7"
     :GIT-BLOB "67f5e2cd4ebf3ac5e8b45063b277b62312050560")
    (:RELATIVE-PATH "SPK-06.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-06.lisp")
     :BYTES 24000 :SHA256 "8eb20aecc32495d8ff69c2a099c5add6d71a02996b2fbe13f75db5a64edfc169"
     :GIT-BLOB "75a9d6beacd8cc4ef3127e25f8504d95cfc994de")
    (:RELATIVE-PATH "SPK-07.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-07.lisp")
     :BYTES 318 :SHA256 "b6e349585c764df6dbe4b962d2cc8704e2695337076686bf69367caa9cff08a8"
     :GIT-BLOB "2a6e56060415a04acd1d01423e87efbc0cdda81b")
    (:RELATIVE-PATH "SPK-07.lisp.gz" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-07.lisp.gz")
     :BYTES 410637 :SHA256 "bb0f1df40ad7e306817a2a3cf714947b4e699aefdcd1130e0b5f3c38b563d77e"
     :GIT-BLOB "34289fb9c5406531e75b5020466a6f02276dc232")
    (:RELATIVE-PATH "SPK-08.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-08.lisp")
     :BYTES 292334 :SHA256 "41d8e07334504a7b78ef4fc11c1488bae076c44d10a3f8ad08c34ff286384c38"
     :GIT-BLOB "673ba6832b9f60777eb49fe79eda2352e5b1a418")
    (:RELATIVE-PATH "SPK-09.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-09.lisp")
     :BYTES 2472 :SHA256 "4e9651c98447f48899670ba6aabe034449cab9eb45056eb261df2ff42b339fd1"
     :GIT-BLOB "dcd92db58f17bfea4af658760d2e56c57ed792d0")
    (:RELATIVE-PATH "SPK-10.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/SPK-10.lisp")
     :BYTES 22977 :SHA256 "47f47fd67b5ca959a1d9a16c9fea795b4a30bef02a855892b0db9823e8761eb8"
     :GIT-BLOB "c360baf8e3de717f0d9e3b4763c5485730b4c7e9")
    (:RELATIVE-PATH "conservazione.lisp" :PATH
     #A((89) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/conservazione.lisp")
     :BYTES 2264 :SHA256 "a95e7063adb4ca509d7aeaafba00955c93528b57e78bfa48baabd32d357912ef"
     :GIT-BLOB "34f185e7f863ccd19e8877dd6f2687a9fbd82c51")
    (:RELATIVE-PATH "report.lisp" :PATH
     #A((82) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/report.lisp")
     :BYTES 318 :SHA256 "2e0677e8ffb835840258efd2c43703673790db196882af549b3f9272eff9af23"
     :GIT-BLOB "7442c2f9fef8d519840aa7c69c4fd6b1ddbbe8e5")
    (:RELATIVE-PATH "report.lisp.gz" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-15-pool-worker-step/campaigns/check-core-spikes/report.lisp.gz")
     :BYTES 467464 :SHA256 "625ce489024c8f413ba82eea879ea7c1901f7fc1e536f94ecf2e4224bbcd1bba"
     :GIT-BLOB "48ddfd76f0c178f763518d86c51441b43a5d57f7"))))
 :COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST)
 :LIMITS
 (:ORIGINAL-PROCESS-REPORT-AND-CONSERVATION :NO-STATUS-PROMOTION :ONE-DIRECTORY-PER-PROCESS
  :ORIGINAL-GZIP-PAYLOAD-BASENAME :ALL-RECURSIVE-UTF8-DEVELOPMENT-SOURCES :ONLY-FASL-EXCLUDED))
