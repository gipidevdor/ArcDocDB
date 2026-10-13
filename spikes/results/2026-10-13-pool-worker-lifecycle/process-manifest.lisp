(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :BASE
 "c4bbb037b779d33ee9e8c01b4a33aac875ccf96f" :PROCESSES
 ((:NAME "selftest" :ID "4000910603-command-11895-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910603-command-11895-0/")
   :PUBLISHED-DIRECTORY
   #A((67) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/selftest/"))
  (:NAME "benchmark" :ID "4000910621-command-11962-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910621-command-11962-0/")
   :PUBLISHED-DIRECTORY
   #A((68) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/benchmark/"))
  (:NAME "coverage" :ID "4000910644-command-12377-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910644-command-12377-0/")
   :PUBLISHED-DIRECTORY
   #A((67) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/coverage/"))
  (:NAME "check-core" :ID "4000910703-command-13310-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910703-command-13310-0/")
   :PUBLISHED-DIRECTORY
   #A((69) BASE-CHAR . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core/"))
  (:NAME "check-core-attempt-1" :ID "4000910605-command-11912-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910605-command-11912-0/")
   :PUBLISHED-DIRECTORY
   #A((79) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-1/"))
  (:NAME "check-core-attempt-2" :ID "4000910632-command-12130-0" :SOURCE-DIRECTORY
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910632-command-12130-0/")
   :PUBLISHED-DIRECTORY
   #A((79) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-2/"))
  (:NAME "integrated-build" :ID "4000911049-command-19367-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000911049-command-19367-0/")
   :PUBLISHED-DIRECTORY
   #A((75) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/integrated-build/"))
  (:NAME "publication-selftest-attempt-1" :ID "4000911325-command-22225-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000911325-command-22225-0/")
   :PUBLISHED-DIRECTORY
   #A((89) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest-attempt-1/"))
  (:NAME "publication-selftest" :ID "4000911543-command-23689-0" :SOURCE-DIRECTORY
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000911543-command-23689-0/")
   :PUBLISHED-DIRECTORY
   #A((79) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest/")))
 :DATA
 ((:NAME "coverage-audit" :SOURCE
   #A((122) BASE-CHAR
      . "/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/coverage-attempt-01/coverage-audit.lisp")
   :PUBLISHED
   #A((87) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/data/coverage-audit/coverage-audit.lisp"))
  (:NAME "publication-selftest-attempt-1" :SOURCE
   #A((62) BASE-CHAR . "/tmp/lifecycle-publication-fixture-ZxpZN6/selftest-report.lisp") :PUBLISHED
   #A((104) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/data/publication-selftest-attempt-1/selftest-report.lisp"))
  (:NAME "publication-selftest" :SOURCE
   #A((62) BASE-CHAR . "/tmp/lifecycle-publication-fixture-l7tyL8/selftest-report.lisp") :PUBLISHED
   #A((94) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/data/publication-selftest/selftest-report.lisp"))
  (:NAME "benchmark" :SOURCE
   #A((111) BASE-CHAR
      . "/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/bench-attempt-01/report.lisp")
   :PUBLISHED
   #A((74) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/data/benchmark/report.lisp")))
 :CAMPAIGNS
 ((:NAME "check-core-spikes" :SOURCE-DIRECTORY
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910872-check-16097-0/")
   :PUBLISHED-DIRECTORY
   #A((76) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/")
   :FILES
   ((:RELATIVE-PATH "SPK-01.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-01.lisp")
     :BYTES 27228 :SHA256 "e15a0396cc07b5f7e0779867f217813598e846732d727cfa4a9849a8f7ebcba4"
     :GIT-BLOB "c0b99a82f8e858cc7c6a34ab05d53c8f905c5e9e")
    (:RELATIVE-PATH "SPK-02.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-02.lisp")
     :BYTES 1607 :SHA256 "1140f245b21964487d4e392eb8b2399add3197cc361db2ddca7d0fbfeda91675"
     :GIT-BLOB "299687342fee2e3e76b673f5e54ceee745199f67")
    (:RELATIVE-PATH "SPK-03.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-03.lisp")
     :BYTES 3640 :SHA256 "f3fdd0c0e41e51cb0d1ddcec681d2692f53dfd207305559075a843168854c896"
     :GIT-BLOB "f8e0fff5753d41c04edffbc4a0c8bfcb5f337989")
    (:RELATIVE-PATH "SPK-04.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-04.lisp")
     :BYTES 6752 :SHA256 "ba57e3a2ce37c28826f76dad1d5c6db04b0bde2c2ee5a2c27ea019f3b9346939"
     :GIT-BLOB "da9fe191c1745ba6abb3bd010557819d57986096")
    (:RELATIVE-PATH "SPK-05.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-05.lisp")
     :BYTES 10170 :SHA256 "549f04babe48893afc4b4381995a03485e662bee9cc16b4e22334f4064c3e068"
     :GIT-BLOB "8e0fd5b44c3baa0bc7a8986c568392b7d5aa4da3")
    (:RELATIVE-PATH "SPK-06.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-06.lisp")
     :BYTES 24082 :SHA256 "70ab808ba172b5e7875eb6f15ee0996bc881fa263c953ddc6ac25de6b59f9ee0"
     :GIT-BLOB "20774f27cc230e368c41732921814f4853d3f9b0")
    (:RELATIVE-PATH "SPK-07.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-07.lisp")
     :BYTES 318 :SHA256 "f792f7593ae37334835132c4b11d244c1d81e252f10e747cc75baaba9e464f76"
     :GIT-BLOB "d35e3232abd8aa10253b41ae710d08ffbc41d0dc")
    (:RELATIVE-PATH "SPK-07.lisp.gz" :PATH
     #A((90) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-07.lisp.gz")
     :BYTES 410629 :SHA256 "6668b53bdda5a58da6ca7e56e67b08bb983c67fd48cee6e27ad0e1d45af14754"
     :GIT-BLOB "eff91876f031f31e8b82dfa73d6006b782402b96")
    (:RELATIVE-PATH "SPK-08.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-08.lisp")
     :BYTES 291712 :SHA256 "ef0392e980f78236f2eed1be33ddde6199377497eea9fb03e5dadb82e9edb6f1"
     :GIT-BLOB "4014aeba86511ca9214e46165993994a191f4132")
    (:RELATIVE-PATH "SPK-09.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-09.lisp")
     :BYTES 2472 :SHA256 "a299f2c3ff538f09343407c3028dbced6df7dc75a95402e081a07928b21925aa"
     :GIT-BLOB "111cac89d544de8a2353239ac9a28f0bd6fdf254")
    (:RELATIVE-PATH "SPK-10.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/SPK-10.lisp")
     :BYTES 22977 :SHA256 "a72ecfe43224afc540dc65545184ea9e16c71c0923fef0b0f51d6615de586a25"
     :GIT-BLOB "187b27c7564dc576904cfdf3527a8b60f0258dbe")
    (:RELATIVE-PATH "conservazione.lisp" :PATH
     #A((94) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/conservazione.lisp")
     :BYTES 2289 :SHA256 "58f7bc64290b7de2c9f0a9f2f393435cf1fdcbc5d2e3edcd7d24d4238c7d51e8"
     :GIT-BLOB "115acd482c528e20b1e10ac58f34ebd5bc9455bf")
    (:RELATIVE-PATH "report.lisp" :PATH
     #A((87) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/report.lisp")
     :BYTES 318 :SHA256 "bc5559b93e4184adfc5f7d4fe919b1a582d9d452984fadfb0d137dca02076bdb"
     :GIT-BLOB "5a543e4fccb572acc4d67de816a50f275e3cda0d")
    (:RELATIVE-PATH "report.lisp.gz" :PATH
     #A((90) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/check-core-spikes/report.lisp.gz")
     :BYTES 467038 :SHA256 "0b7f9e27a15b134c42b34fa3a4ca70db6c3217ff56e7150cd002fdcc5ff45e93"
     :GIT-BLOB "dd18f73220e30eef1dda2893e0735d8b2c444155")))
  (:NAME "publication-fixture-attempt-1-large" :SOURCE-DIRECTORY
   #A((66) BASE-CHAR . "/private/tmp/lifecycle-publication-fixture-ZxpZN6/large-published/")
   :PUBLISHED-DIRECTORY
   #A((94) BASE-CHAR
      . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/")
   :FILES
   ((:RELATIVE-PATH "development-evidence.lisp" :PATH
     #A((119) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/development-evidence.lisp")
     :BYTES 385 :SHA256 "c48bc41f958f27902ac33dec5fe433e7d3559d6c5f48930c047f9f1217acedca"
     :GIT-BLOB "6dbb1344c24ac9a0a869fe3f3039485ec8cfdd3a")
    (:RELATIVE-PATH "development-large-1.lisp" :PATH
     #A((118) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/development-large-1.lisp")
     :BYTES 328 :SHA256 "e00306776c886700af4c8d6e682efdbcc65911230ef89ae641224fd840d273fa"
     :GIT-BLOB "7542d196a8465fd7fb5a12945c007d1594306026")
    (:RELATIVE-PATH "development-large-1.lisp.gz" :PATH
     #A((121) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/development-large-1.lisp.gz")
     :BYTES 1424 :SHA256 "be20108cea8d7500c515206c4de4d60f870a54fbe3b7282423d818581be35b04"
     :GIT-BLOB "1ad3d3dcd79f8bbb4284f3cfcc9355af00820415")
    (:RELATIVE-PATH "development-large-conservazione.lisp" :PATH
     #A((130) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/development-large-conservazione.lisp")
     :BYTES 1725 :SHA256 "ab78c1380e307c279e048a6b9219906b0fe0b26ad1273daa792bdbf49d393b1f"
     :GIT-BLOB "f14dc2e284a9f091c00464ab3fe0dce7b1a8213a")
    (:RELATIVE-PATH "development-manifest.lisp" :PATH
     #A((119) BASE-CHAR
        . "spikes/results/2026-10-13-pool-worker-lifecycle/campaigns/publication-fixture-attempt-1-large/development-manifest.lisp")
     :BYTES 1014 :SHA256 "656e4bcce1716472c4b18a7db07dbdaa8731e3aa533fb2ac198ae5ef76a0b0f5"
     :GIT-BLOB "ee7fbdcfe27f1ae4f164a46a4aa452aed48b073f"))))
 :COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST)
 :LIMITS
 (:ORIGINAL-PROCESS-REPORT-AND-CONSERVATION :NO-STATUS-PROMOTION :ONE-DIRECTORY-PER-PROCESS
  :ORIGINAL-GZIP-PAYLOAD-BASENAME :ALL-RECURSIVE-UTF8-DEVELOPMENT-SOURCES :ONLY-FASL-EXCLUDED))
