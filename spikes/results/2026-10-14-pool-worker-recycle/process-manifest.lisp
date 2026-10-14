(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :BASE
 "a5715a1aa0b2571d650d1b794e9bb7b7324e951e" :PROCESSES
 ((:NAME "publisher-selftest" :ID "4000984350-command-38941-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38941-0/")
   :PUBLISHED-DIRECTORY
   #A((75) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/processes/publisher-selftest/"))
  (:NAME "coverage-reader" :ID "4000984374-command-39216-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984374-command-39216-0/")
   :PUBLISHED-DIRECTORY
   #A((72) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-recycle/processes/coverage-reader/"))
  (:NAME "selftest" :ID "4000984374-command-39217-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984374-command-39217-0/")
   :PUBLISHED-DIRECTORY
   #A((65) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-recycle/processes/selftest/"))
  (:NAME "coverage" :ID "4000984374-command-39218-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984374-command-39218-0/")
   :PUBLISHED-DIRECTORY
   #A((65) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-recycle/processes/coverage/"))
  (:NAME "benchmark" :ID "4000984410-command-39982-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984410-command-39982-0/")
   :PUBLISHED-DIRECTORY
   #A((66) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-recycle/processes/benchmark/"))
  (:NAME "check-core" :ID "4000984350-command-38940-0" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38940-0/")
   :PUBLISHED-DIRECTORY
   #A((67) BASE-CHAR . "spikes/results/2026-10-14-pool-worker-recycle/processes/check-core/"))
  (:NAME "integrated-build" :ID "4000984849-command-45285-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000984849-command-45285-0/")
   :PUBLISHED-DIRECTORY
   #A((73) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/processes/integrated-build/")))
 :DATA
 ((:NAME "coverage-audit" :SOURCE
   #A((123) BASE-CHAR
      . "/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-audit.lisp")
   :PUBLISHED
   #A((85) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/data/coverage-audit/coverage-audit.lisp"))
  (:NAME "recycle-coverage-audit" :SOURCE
   #A((132) BASE-CHAR
      . "/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :PUBLISHED
   #A((102) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/data/recycle-coverage-audit/coverage-dispatch-audit.lisp"))
  (:NAME "benchmark" :SOURCE
   #A((112) BASE-CHAR
      . "/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/bench-attempt-01/report.lisp")
   :PUBLISHED
   #A((72) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/data/benchmark/report.lisp")))
 :CAMPAIGNS
 ((:NAME "check-core-spikes" :SOURCE-DIRECTORY
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984576-check-42207-0/")
   :PUBLISHED-DIRECTORY
   #A((74) BASE-CHAR
      . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/")
   :FILES
   ((:RELATIVE-PATH "SPK-01.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-01.lisp")
     :BYTES 27228 :SHA256 "52ee0cd6c7182e90120e21ad77669c86effc90fa10281040deb61527dee11782"
     :GIT-BLOB "e1da417231f2c273e26b1c046e13fd5a5c90dc89")
    (:RELATIVE-PATH "SPK-02.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-02.lisp")
     :BYTES 1607 :SHA256 "31a73a459d136ec0078fba117c752cd80ead5c92a0a967171a6fd580216de1fe"
     :GIT-BLOB "1aa3898122d6ded7f9dcdd708477be38d91b4d7f")
    (:RELATIVE-PATH "SPK-03.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-03.lisp")
     :BYTES 3636 :SHA256 "6b2f819e5eb66d78852fd014ec18b31802b4ab4abaf02ea4fff458042940b4cf"
     :GIT-BLOB "78b1031b106846acc1fbcd8883fa1cb5527c7a4d")
    (:RELATIVE-PATH "SPK-04.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-04.lisp")
     :BYTES 6752 :SHA256 "6e1091a2684d5ab19bda2b3a3974215ea97a897e6a14421526168d225b3fbe8a"
     :GIT-BLOB "fce64af8d73c3137def4d642ebe26b0297e96574")
    (:RELATIVE-PATH "SPK-05.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-05.lisp")
     :BYTES 10094 :SHA256 "03628c649290b9b7aa0d8237d3cf70bf0d2085c170e207ad415e6a352f37a778"
     :GIT-BLOB "21326a75d3f8a1344980325fef60465a1f26c0e5")
    (:RELATIVE-PATH "SPK-06.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-06.lisp")
     :BYTES 24070 :SHA256 "04fce5d5ed0f509776ebe18569152f156818671ae20f3e43dc21bf9bf8f4626b"
     :GIT-BLOB "8bd0907946e6e709f44f1d94a22b065e7082f0eb")
    (:RELATIVE-PATH "SPK-07.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-07.lisp")
     :BYTES 318 :SHA256 "e859d82e1becd63e09c51f3ea4b887d72df538d349a9dd662b8b560b89c1c66b"
     :GIT-BLOB "b60b65dfc2509d12a8e359283f2d96d839ffbc3e")
    (:RELATIVE-PATH "SPK-07.lisp.gz" :PATH
     #A((88) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-07.lisp.gz")
     :BYTES 410659 :SHA256 "77748dbcda61112c118360d93226d4c9fa5967fd8172c88b51639657a6dec8ce"
     :GIT-BLOB "cea2b6d21277ea7e2189105589275cbc7b667810")
    (:RELATIVE-PATH "SPK-08.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-08.lisp")
     :BYTES 291711 :SHA256 "06c4268b1be14853ec76312d5cad4327394a8f04a94394094a1bae286a6ae15d"
     :GIT-BLOB "cf9171a174a5cf91d55fc03bf34a70e74f15cdd3")
    (:RELATIVE-PATH "SPK-09.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-09.lisp")
     :BYTES 2472 :SHA256 "56ce63f374be38622eab4fa456e08d64d94ad31bbbbda68b5d193f11dfc75780"
     :GIT-BLOB "a1eb22ebc4ae06c13926eaa61c3ec2ba4f5eb9bc")
    (:RELATIVE-PATH "SPK-10.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/SPK-10.lisp")
     :BYTES 22977 :SHA256 "0856e4623e3539b338926dd85fd03eb97cd449d37a3d2ddd7b5156b811be3414"
     :GIT-BLOB "e0a6a7fb75508cf7a89c303b6199a00c1b3e4743")
    (:RELATIVE-PATH "conservazione.lisp" :PATH
     #A((92) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/conservazione.lisp")
     :BYTES 2279 :SHA256 "5d4bd4cf97db491d1cbb2d040abb4d115b8bfc5ad2ec8a135f1be808acd2f5a1"
     :GIT-BLOB "0ace58be3b3aeb51abeb3e3b5efbce685ba833e1")
    (:RELATIVE-PATH "report.lisp" :PATH
     #A((85) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/report.lisp")
     :BYTES 318 :SHA256 "f47d942af7926f682f6c4bc055d37ff6e57f898b2f05fd4c436bb0d8d1527a18"
     :GIT-BLOB "d8da70b0d8649d04848714e93d7e54a69e81d6ae")
    (:RELATIVE-PATH "report.lisp.gz" :PATH
     #A((88) BASE-CHAR
        . "spikes/results/2026-10-14-pool-worker-recycle/campaigns/check-core-spikes/report.lisp.gz")
     :BYTES 467062 :SHA256 "4cb513e1fda0ae6ca7f74a1f5d195c6ea6c39e5eebf876cd12ae842df87738b3"
     :GIT-BLOB "e256f3389fd08e390f7238d8974c20a38b3e3019"))))
 :COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST)
 :LIMITS
 (:ORIGINAL-PROCESS-REPORT-AND-CONSERVATION :NO-STATUS-PROMOTION :ONE-DIRECTORY-PER-PROCESS
  :ORIGINAL-GZIP-PAYLOAD-BASENAME :ALL-RECURSIVE-UTF8-DEVELOPMENT-SOURCES :ONLY-FASL-EXCLUDED))
