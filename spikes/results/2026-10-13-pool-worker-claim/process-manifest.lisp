(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :BASE
 "900fa93d9e14a252e6a2b5a009d19728b2de34af" :PROCESSES
 ((:NAME "selftest" :ID "4000913361-command-73795-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913361-command-73795-0/")
   :PUBLISHED-DIRECTORY
   #A((63) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/selftest/"))
  (:NAME "coverage" :ID "4000913361-command-73794-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913361-command-73794-0/")
   :PUBLISHED-DIRECTORY
   #A((63) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/coverage/"))
  (:NAME "benchmark" :ID "4000913399-command-74843-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913399-command-74843-0/")
   :PUBLISHED-DIRECTORY
   #A((64) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/benchmark/"))
  (:NAME "coverage-reader" :ID "4000913465-command-76699-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913465-command-76699-0/")
   :PUBLISHED-DIRECTORY
   #A((70) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/coverage-reader/"))
  (:NAME "check-core" :ID "4000913331-command-73208-0" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913331-command-73208-0/")
   :PUBLISHED-DIRECTORY
   #A((65) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/check-core/"))
  (:NAME "integrated-build" :ID "4000913736-command-84415-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000913736-command-84415-0/")
   :PUBLISHED-DIRECTORY
   #A((71) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/processes/integrated-build/")))
 :DATA
 ((:NAME "coverage-audit" :SOURCE
   #A((119) BASE-CHAR
      . "/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-audit.lisp")
   :PUBLISHED
   #A((83) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-claim/data/coverage-audit/coverage-audit.lisp"))
  (:NAME "claim-coverage-audit" :SOURCE
   #A((125) BASE-CHAR
      . "/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-claim-audit.lisp")
   :PUBLISHED
   #A((95) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-claim/data/claim-coverage-audit/coverage-claim-audit.lisp"))
  (:NAME "benchmark" :SOURCE
   #A((108) BASE-CHAR
      . "/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/bench-attempt-01/report.lisp")
   :PUBLISHED
   #A((70) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/data/benchmark/report.lisp")))
 :CAMPAIGNS
 ((:NAME "check-core-spikes" :SOURCE-DIRECTORY
   #A((94) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913535-check-78876-0/")
   :PUBLISHED-DIRECTORY
   #A((72) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/")
   :FILES
   ((:RELATIVE-PATH "SPK-01.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-01.lisp")
     :BYTES 27228 :SHA256 "186ea0d90a66872cb19460c9cd41699224336ba9b06136b597c1becf4f06e928"
     :GIT-BLOB "26a22ad30b097051c4e1dbe437828f8a2c779013")
    (:RELATIVE-PATH "SPK-02.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-02.lisp")
     :BYTES 1607 :SHA256 "dd5bb4d6d30ffa1bbe1d3e62bd1dc9caaa626a8d520951122259616cb8b19a25"
     :GIT-BLOB "a1b6b075a6b6f2452300342caf79adaa3a2cc1d4")
    (:RELATIVE-PATH "SPK-03.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-03.lisp")
     :BYTES 3632 :SHA256 "4bc81cfe3768d0d5fed4925d1ae57510dcc6555c82e3d5365d0c554c9732a8d6"
     :GIT-BLOB "ff8ab5dad7152439dea1da856ce9214100843780")
    (:RELATIVE-PATH "SPK-04.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-04.lisp")
     :BYTES 6752 :SHA256 "cee7d21c09438c6e3e1e2fd8e0e78bc44dd3a0d5cbce3bf9509be0dd466f5120"
     :GIT-BLOB "dead80b2009f3dc5b9c3c295accf55d8f5f3660f")
    (:RELATIVE-PATH "SPK-05.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-05.lisp")
     :BYTES 10120 :SHA256 "70e96499ce58b2f9e30a9a8f2ab364450beea36cff70cab0cf62a2f49484d4fc"
     :GIT-BLOB "6e015d26487491a5cba631015669b729ff8ed923")
    (:RELATIVE-PATH "SPK-06.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-06.lisp")
     :BYTES 24120 :SHA256 "2e8de760abe802fd05c948afe07aa7d061a2f30f974c05bfd7b2ae52e823e739"
     :GIT-BLOB "ed0bb0de3d82dbb2989acf11b522ad9a2fde0f88")
    (:RELATIVE-PATH "SPK-07.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-07.lisp")
     :BYTES 318 :SHA256 "d4b94ef4b1c4e3ce4e8738d4fccab4fee0aa4b09088ab8fcdf8b27f00b07fd11"
     :GIT-BLOB "abc005cb090f6b686b6898643764ef4923a65a8d")
    (:RELATIVE-PATH "SPK-07.lisp.gz" :PATH
     #A((86) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-07.lisp.gz")
     :BYTES 410633 :SHA256 "3bacc51461e7c407b0f634bccdea6e58430534ac3b0001fb2cf7764ffa1c4a34"
     :GIT-BLOB "6ef822e570d997017b632c6a6c03c033a2d33fee")
    (:RELATIVE-PATH "SPK-08.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-08.lisp")
     :BYTES 291712 :SHA256 "a228b5aea8df938657d95ba849a9c243d89277e5cc40d9964372f844640e7015"
     :GIT-BLOB "1afb5d0f0b25c49db047810b644a625c398c6edf")
    (:RELATIVE-PATH "SPK-09.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-09.lisp")
     :BYTES 2472 :SHA256 "c88599ef50c8462210cc683e305fdc8b2fa1d035eed6a57201bbdabb319b6524"
     :GIT-BLOB "110ed135803f41c7c0b66caa970f16b162715e9f")
    (:RELATIVE-PATH "SPK-10.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/SPK-10.lisp")
     :BYTES 22977 :SHA256 "e4a9af4e65255f524185167e08c073d1800409bac938154fb3ca3612152b5f28"
     :GIT-BLOB "ca5b6143b415471e5a087117aa87efb25fd70a4d")
    (:RELATIVE-PATH "conservazione.lisp" :PATH
     #A((90) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/conservazione.lisp")
     :BYTES 2269 :SHA256 "74421d861a81c1d5deb408e016cd37489d4608ec19a5d222de49ee42aa00b6d4"
     :GIT-BLOB "5f8f5180088221e82b8a39e2c911c65c0fc2209a")
    (:RELATIVE-PATH "report.lisp" :PATH
     #A((83) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/report.lisp")
     :BYTES 318 :SHA256 "f9ea53b7bef11a5480faccb64cffff28a7edb8a9d754003e96c676dbc66d06fe"
     :GIT-BLOB "133d7303b6e75c6fcb50bd292cbb69b3781b7d2c")
    (:RELATIVE-PATH "report.lisp.gz" :PATH
     #A((86) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-claim/campaigns/check-core-spikes/report.lisp.gz")
     :BYTES 467082 :SHA256 "bf8bf9db42d9f27eb60dced2ba927291934f6926e8c588ba5fcf963678667573"
     :GIT-BLOB "1d15b321a976967b273b56b1de327d7b022c407e"))))
 :COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST)
 :LIMITS
 (:ORIGINAL-PROCESS-REPORT-AND-CONSERVATION :NO-STATUS-PROMOTION :ONE-DIRECTORY-PER-PROCESS
  :ORIGINAL-GZIP-PAYLOAD-BASENAME :ALL-RECURSIVE-UTF8-DEVELOPMENT-SOURCES :ONLY-FASL-EXCLUDED))
