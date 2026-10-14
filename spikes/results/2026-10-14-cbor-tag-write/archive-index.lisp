(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((14) BASE-CHAR . "freeze-sources") :RECORD-PATH
   "processes/freeze-sources/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/freeze-sources.lisp")))
  (:LABEL #A((30) BASE-CHAR . "initial-build-lint-trace-links") :RECORD-PATH
   "processes/initial-build-lint-trace-links/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links")))
  (:LABEL #A((15) BASE-CHAR . "bench-self-test") :RECORD-PATH
   "processes/bench-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((15) BASE-CHAR . "audit-self-test") :RECORD-PATH
   "processes/audit-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((18) BASE-CHAR . "coverage-self-test") :RECORD-PATH
   "processes/coverage-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/coverage-self-test/")))
  (:LABEL #A((20) BASE-CHAR . "collection-self-test") :RECORD-PATH
   "processes/collection-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/self-test/")))
  (:LABEL #A((5) BASE-CHAR . "bench") :RECORD-PATH
   "processes/bench/report.lisp" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((16) BASE-CHAR . "bench-data-audit") :RECORD-PATH
   "processes/bench-data-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74250-0/report.lisp")
    #A((40) BASE-CHAR . "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
    #A((40) BASE-CHAR . "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b")))
  (:LABEL #A((12) BASE-CHAR . "coverage-tag") :RECORD-PATH
   "processes/coverage-tag/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((44) BASE-CHAR . "spikes/out/cbor-tag-write-20261014/coverage/")
    #A((14) BASE-CHAR . "cbor-tag-write")))
  (:LABEL #A((34) BASE-CHAR . "mutation-self-test-invalid-options")
   :RECORD-PATH "processes/mutation-self-test-invalid-options/report.lisp"
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/mutation-self-test/")))
  (:LABEL #A((18) BASE-CHAR . "mutation-self-test") :RECORD-PATH
   "processes/mutation-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((16) BASE-CHAR . "integrated-check") :RECORD-PATH
   "processes/integrated-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((17) BASE-CHAR . "mutation-campaign") :RECORD-PATH
   "processes/mutation-campaign/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((45) BASE-CHAR . "spikes/out/cbor-tag-write-20261014/mutations/")))
  (:LABEL #A((20) BASE-CHAR . "coverage-compression") :RECORD-PATH
   "processes/coverage-compression/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((44) BASE-CHAR . "spikes/out/cbor-tag-write-20261014/coverage/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")
    #A((21) BASE-CHAR . "--minimum-age-seconds") #A((1) BASE-CHAR . "0")))
  (:LABEL #A((40) BASE-CHAR . "final-integration-build-lint-trace-links")
   :RECORD-PATH
   "processes/final-integration-build-lint-trace-links/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links")))
  (:LABEL #A((20) BASE-CHAR . "manifest-preparation") :RECORD-PATH
   "processes/manifest-preparation/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/prepare-archive.lisp")
    #A((20) BASE-CHAR . "--integration-report")
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/report.lisp")))
  (:LABEL #A((17) BASE-CHAR . "archive-preflight") :RECORD-PATH
   "processes/archive-preflight/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/preflight-archive.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/manifest.lisp")
    #A((13) BASE-CHAR . "--destination")
    #A((41) BASE-CHAR . "spikes/results/2026-10-14-cbor-tag-write/")
    #A((8) BASE-CHAR . "--report")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/preflight.lisp")))
  (:LABEL #A((19) BASE-CHAR . "parallel-collection") :RECORD-PATH
   "processes/parallel-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/manifest.lisp")
    #A((41) BASE-CHAR . "spikes/results/2026-10-14-cbor-tag-write/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((23) BASE-CHAR . "collection-data-reading") :RECORD-PATH
   "processes/collection-data-reading/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/read-collection.lisp")
    #A((155) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000998213-9708-0.lisp")
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/closed-check-4000998277-9708-0.log")))
  (:LABEL #A((29) BASE-CHAR . "preserve-collection-originals") :RECORD-PATH
   "processes/preserve-collection-originals/report.lisp" :STATUS :OK :EXIT-CODE
   0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-tag-write-20261014/collection/preserve-originals.lisp")
    #A((155) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000998213-9708-0.lisp")
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/closed-check-4000998277-9708-0.log")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/report.lisp"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/manifest.lisp")
   :BYTES 70486 :SHA256
   "94c4019a2abcf73940d6a02fe29e88a12573ac5be870232fb488027a9f449938")
  (:PATH "collection-source.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "processes/audit-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64475-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "a18afec5fa49b9dd1b709292d7a4be6e6280ca3c0d8b1630a274601273c17f1a")
  (:PATH "processes/audit-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64475-0/report.lisp")
   :BYTES 189240 :SHA256
   "ebbfdd41ec3ab85673590eec792d04d767824fb63e1d7dd584b9ebce615d443a")
  (:PATH "processes/bench-data-audit/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996957-command-77330-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "17154fa99a71f66440fc1321c47b07b44dccac2c0a8e47fe2a97b1161b96dacb")
  (:PATH "processes/bench-data-audit/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996957-command-77330-0/report.lisp")
   :BYTES 186921 :SHA256
   "e141f3e4f28637b59049f6a13b045974c849fb53c5cd422cf11a576062839469")
  (:PATH "processes/bench-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64474-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "3087d237aad441db8fa4023dcc629e9f5cc72df5afb1bcd780ca42be70b5076c")
  (:PATH "processes/bench-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64474-0/report.lisp")
   :BYTES 233389 :SHA256
   "b7de4810dbabddbdce548ddb632c58c5c0cfed503ba37f5c3c24814cfda3e2ed")
  (:PATH "processes/bench/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74250-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "0c03bcf83891cef2ae3c205e155685b882c3120e46f56448c6bc62b303af641d")
  (:PATH "processes/bench/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74250-0/report.lisp")
   :BYTES 242887 :SHA256
   "a79d9b541de087ac2e0571632ed1ee72c577b7c1b7d9a3677ecf66079342dba0")
  (:PATH "processes/collection-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64491-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "dea63863cd24812b50068b5fe238f49776d99ed34222f86ad37afcf7a20edbc3")
  (:PATH "processes/collection-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64491-0/report.lisp")
   :BYTES 185804 :SHA256
   "c5f2df8934569f0c63e3aa81259a54f33ac6e09633dc5a3c97783f56a9585aab")
  (:PATH "processes/coverage-compression/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997503-command-96971-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "673e2cc4ce4524d6b7171787aab168d871e6d7d12688a3339e76c7b52d8b1cd6")
  (:PATH "processes/coverage-compression/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997503-command-96971-0/report.lisp")
   :BYTES 186148 :SHA256
   "524b1820566b58a871af5efc9846be5d86aa793f3abc44254fd3422a5adf54f4")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64481-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "42e8700cdb11a83e862ae178ad35d7124a8fd5f31733b300e6a0a61a834c34c2")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996819-command-64481-0/report.lisp")
   :BYTES 185014 :SHA256
   "3f13d15675fabb757373316edfa7d02c363612f791944255b35e685551349373")
  (:PATH "processes/coverage-tag/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74254-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f6b2165d81d993b97759585001c333379ea85d31f76b652f721fa68e5c1d90d1")
  (:PATH "processes/coverage-tag/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74254-0/report.lisp")
   :BYTES 187103 :SHA256
   "dfd78544eef2e9f84017583ac14aac85d1a97189227a086cde54b0416e5a9fc2")
  (:PATH
   "processes/final-integration-build-lint-trace-links/conservazione.lisp"
   :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/conservazione.lisp")
   :BYTES 1731 :SHA256
   "24921dc924346220fb53d8dc56cef9d1c2be585e2ee92bf16d0f1cda1e6d127e")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp"
   :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/report.lisp")
   :BYTES 317 :SHA256
   "4dd73de1fe445cad08737f2090081794963da9143e7173e91cb2d31d87e6f0b9")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp.gz"
   :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997959-command-5777-0/report.lisp.gz")
   :BYTES 153126 :SHA256
   "b48199c6a94f1eb3713d1142e4c4ebce6b6e5b8f61f87830b1fafdf5f71d9e63")
  (:PATH "processes/freeze-sources/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996626-command-59906-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "5930eb72ee2ff1a9910467426fc63eef7d07b495448808da775f877ab8040117")
  (:PATH "processes/freeze-sources/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996626-command-59906-0/report.lisp")
   :BYTES 184923 :SHA256
   "798f28a42fbdb10a8f251a0e3d023720872896bdcdee4c226da025f1d3e6a7b5")
  (:PATH "processes/initial-build-lint-trace-links/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "47cb79fb959a43ab44dd309cc0ab92cce8ce06ba274317742d5be2dd28fca4d1")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/report.lisp")
   :BYTES 317 :SHA256
   "983e3c3a1652450f5fb8ad5fd43c54e82aa3bdcaf2aa8e59894d04204e64aa17")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996656-command-60753-0/report.lisp.gz")
   :BYTES 149047 :SHA256
   "43185e975389a26efc85c75d9d8a2a77db42642104c5e077a3d18d27aea26ede")
  (:PATH "processes/integrated-check/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "2b800c6aa7e980f04b72ae7ee022fa31193b55ca456d81f9a796c4d29afdc608")
  (:PATH "processes/integrated-check/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/report.lisp")
   :BYTES 317 :SHA256
   "3a985282de01545ab18241298d3c5bb62190520963df148e34c863a66030ce33")
  (:PATH "processes/integrated-check/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996821-command-64571-0/report.lisp.gz")
   :BYTES 155883 :SHA256
   "ea6dfba8f9ff33deb170259ae1e49417c028f3101de60dc10edc04b731e03158")
  (:PATH "processes/mutation-campaign/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997059-command-81284-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "9c710d8034b009f5dfeacea7e649e01c3b1c6d65f094cffcba7954039886c460")
  (:PATH "processes/mutation-campaign/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997059-command-81284-0/report.lisp")
   :BYTES 281339 :SHA256
   "9650446564e6df96e30e9c66bae4b244611d42c59a2a9195584490f7b26dc8f9")
  (:PATH "processes/mutation-self-test-invalid-options/conservazione.lisp"
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74262-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "edcb1cbc169ef1df100f40205965b6e9409259ac3435238b3fbd46b6b58dd766")
  (:PATH "processes/mutation-self-test-invalid-options/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996908-command-74262-0/report.lisp")
   :BYTES 197716 :SHA256
   "f0021b00aa6a63d7efcd9583a2b18d22670f2d7ebcae8c9e3b0fb8816a686d96")
  (:PATH "processes/mutation-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996994-command-78660-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "b360d4b4b10f7c2cf59aaf21493574c6b2d5231bed60cd622af0ddcbcff3835d")
  (:PATH "processes/mutation-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996994-command-78660-0/report.lisp")
   :BYTES 278534 :SHA256
   "5583d2e52ae6626be686a22d7b1d5b12a1b7462ade8dd09b801f4f08e0ddd67a")
  (:PATH "raw/clone-support-corrected.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/clone-support-corrected.lisp")
   :BYTES 1499 :SHA256
   "5e7d2ba4b437f8fe15fac0a52785c134f74068b3772624b508004a9a9e3f536f")
  (:PATH "raw/clone-support.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/clone-support.lisp")
   :BYTES 1500 :SHA256
   "bc329f9dd4b8476218846f6bd705f173803c46c2b89bf5a2e3f297124be52844")
  (:PATH "raw/collection-self-test/corrupt/collection-manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "fe65edcd06c655157ede8957955ed8d03ba1be9eff7c5ff7db70fa0820b33ab7")
  (:PATH "raw/collection-self-test/corrupt/collection-source.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/collection-source.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection-self-test/corrupt/processes/synthetic/report.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "4648873d1757e47c894b7359c1685f67877133ee4baed81040b49a32b3e9062e")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file00.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file01.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file02.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file03.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file04.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file05.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file06.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file07.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file08.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file09.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file10.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file11.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file12.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file13.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file14.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/corrupt/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/input/duplicate.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/duplicate.lisp")
   :BYTES 635 :SHA256
   "504738171626afbcfb62d7557089e71af8e470571ca3b04e5a2705e4d142f064")
  (:PATH "raw/collection-self-test/input/manifest.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/manifest.lisp")
   :BYTES 436 :SHA256
   "fe65edcd06c655157ede8957955ed8d03ba1be9eff7c5ff7db70fa0820b33ab7")
  (:PATH "raw/collection-self-test/input/process/report.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/input/tree/file00.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/input/tree/file01.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/input/tree/file02.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/input/tree/file03.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/input/tree/file04.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/input/tree/file05.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/input/tree/file06.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/input/tree/file07.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/input/tree/file08.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/input/tree/file09.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/input/tree/file10.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/input/tree/file11.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/input/tree/file12.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/input/tree/file13.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/input/tree/file14.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/report.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/report.lisp")
   :BYTES 798 :SHA256
   "d864648890644836430ac66d325f76be54bd34fa0b5cd3b8f4ba84f5e5f6b704")
  (:PATH "raw/collection-self-test/valid/archive-index.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/archive-index.lisp")
   :BYTES 6020 :SHA256
   "3042fa235fa5ddae96c1c2a64d62563416bbfa4fd289c8841e53fc1dfeabed2f")
  (:PATH "raw/collection-self-test/valid/catalogo.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/catalogo.lisp")
   :BYTES 406 :SHA256
   "301d940aed920d7dcef505b4aed205ac837c934479327dfc95105227788227f3")
  (:PATH "raw/collection-self-test/valid/collection-manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "fe65edcd06c655157ede8957955ed8d03ba1be9eff7c5ff7db70fa0820b33ab7")
  (:PATH "raw/collection-self-test/valid/collection-source.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/collection-source.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection-self-test/valid/processes/synthetic/report.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file00.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file01.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file02.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file03.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file04.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file05.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file06.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file07.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file08.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file09.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file10.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file11.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file12.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file13.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file14.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/self-test/valid/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection/append.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/append.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/collection/build-manifest.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/build-manifest.lisp")
   :BYTES 12551 :SHA256
   "652104c5920fdceca0f68f7aa057a2eadd9edc0cb51743d8cf04d6034c5a0f8d")
  (:PATH "raw/collection/closed-check-4000996827-64670-0.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/closed-check-4000996827-64670-0.log")
   :BYTES 958 :SHA256
   "51ee4d237e980835ad0bf082a8f7af15d4180df1188ed6ce49d981e3a802612f")
  (:PATH "raw/collection/collect.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection/collection-observation-4000996823-64670-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000996823-64670-0.lisp")
   :BYTES 6698 :SHA256
   "65680bc20e1a632cfd26989209d86581ce010c38f7c4fbdd5f47d398f3bc3d10")
  (:PATH "raw/collection/collection-observation-4000996831-64670-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000996831-64670-0.lisp")
   :BYTES 6621 :SHA256
   "8cde1f3561012b0bb482e0471ee0f866d495afcf63930d17f5ac7e2efcaebed5")
  (:PATH "raw/collection/collection-observation-4000996834-64670-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000996834-64670-0.lisp")
   :BYTES 560 :SHA256
   "c5f0f14acee533caee718b8b978edcd08f36d118da2cf88be157cb5801e6611c")
  (:PATH "raw/collection/collection-observation-4000996834-64670-1.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/collection-observation-4000996834-64670-1.lisp")
   :BYTES 409 :SHA256
   "2477e1b6c7b87b79eef7f61486303d6637a80bd31ccc4631a235dd3675d2dd1b")
  (:PATH "raw/collection/preflight-archive.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/preflight-archive.lisp")
   :BYTES 16434 :SHA256
   "df37bf1e745a152d50cdbfdafefc9c4ae524bccfe1d853fd414738c3294d217a")
  (:PATH "raw/collection/prepare-archive.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/prepare-archive.lisp")
   :BYTES 5528 :SHA256
   "1649f30f630c01f3299c669652449b70e8340a9d3f4ea973be947082b4532180")
  (:PATH "raw/collection/preserve-originals.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/preserve-originals.lisp")
   :BYTES 2120 :SHA256
   "a63aae561ead1cf2dd23570050176b156976f5e9b03812fab82d5509aacabc3b")
  (:PATH "raw/collection/read-collection.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/collection/read-collection.lisp")
   :BYTES 1824 :SHA256
   "7739a12c824027a86bb47e135fbe2c4b17278068c83d517e4e2cc75abb342083")
  (:PATH "raw/coverage-self-test/97017ff9c73ff5a29cb58f2b57b3f15a.html" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage-self-test/97017ff9c73ff5a29cb58f2b57b3f15a.html")
   :BYTES 2837 :SHA256
   "cf270ffc59a58083ede20f81deb90ef8df81eaabf6fa29a10f6aa24933533801")
  (:PATH "raw/coverage-self-test/cover-index.html" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage-self-test/cover-index.html")
   :BYTES 1797 :SHA256
   "24b76a8c317f30c1558851436907524460a3b6272820a07f0447938184637c74")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/b83b0aaf801333ff25f7cd44ddf0dad7.html" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage/b83b0aaf801333ff25f7cd44ddf0dad7.html")
   :BYTES 28463 :SHA256
   "73c138835b70056205e9d0478583446317691a858710c7694a1d03fd9635f01a")
  (:PATH "raw/coverage/bc91342dc28410d2e55758fcb7cc59fa.html" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage/bc91342dc28410d2e55758fcb7cc59fa.html")
   :BYTES 25383 :SHA256
   "ce25318ce174014214670cc363ca2f2bfb555b93c6e70cbc62c6ac5625a58453")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage/cover-index.html")
   :BYTES 1951 :SHA256
   "12ad918f42ae6f8909f03a8d8594a89d5239f8c6d97fbae10bd32445e34a6f6b")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "8fac05ac7fd74fea613120b1c064d1cf548b20fe5cef51db2fe205ef40974a87")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/coverage/coverage-state.lisp.gz")
   :BYTES 395719 :SHA256
   "be7ffcb4c870f93a345042583b7f2d0aa19d5c96796445b788c2dafb2cce1c27")
  (:PATH "raw/drivers/adapt-drivers-ready.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/adapt-drivers-ready.lisp")
   :BYTES 18965 :SHA256
   "3f4db5242486d10ffdd59ef57d8fc599c2c310a84671562bc35db07af274f7c3")
  (:PATH "raw/drivers/adapt-drivers.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/adapt-drivers.lisp")
   :BYTES 18974 :SHA256
   "ce85e6d687d3eda62cde7596662f80f00765feac547204d7a428d78b2afabced")
  (:PATH "raw/drivers/audit-before-static-corrections.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/audit-before-static-corrections.lisp")
   :BYTES 43134 :SHA256
   "abaeaab6beb439f434451ecc5a22a04c304509a15833dcd88010ffca21ec377e")
  (:PATH "raw/drivers/audit.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/audit.lisp")
   :BYTES 43558 :SHA256
   "700a313e48bdda95d2c6719e1960269bde8aa5e6378375e7a9f6cc0a4ab47e29")
  (:PATH "raw/drivers/bench.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/bench.lisp")
   :BYTES 15039 :SHA256
   "add7041e0422b3795bff89ca4cd9d6aea2bb4fdcdc327bb225f6d32967770cc4")
  (:PATH "raw/drivers/catalogue-before-product.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/catalogue-before-product.lisp")
   :BYTES 685 :SHA256
   "a70b84675b5398f20f438e9910d787be7c6250393babc2365b643060d9bfe39e")
  (:PATH "raw/drivers/catalogue-materialized.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/catalogue-materialized.lisp")
   :BYTES 11438 :SHA256
   "33940ad8c4f44f8ec802d362f624fa47755575dd814a1481c8746717a063e1e0")
  (:PATH "raw/drivers/driver-pin-correction-history.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/driver-pin-correction-history.md")
   :BYTES 1241 :SHA256
   "ad4641fcaa57ad26213f2bbc6fd0ceaf185d1a7c9f1188a87d8b4ab656752629")
  (:PATH "raw/drivers/fixtures-and-mutations.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp")
   :BYTES 1997 :SHA256
   "08f916abd09f50ec5b84b7ae5769ddbaf590b8f24757cddd1f696e8115e47e19")
  (:PATH "raw/drivers/materialization-history.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialization-history.md")
   :BYTES 4772 :SHA256
   "b61b907dcf574d021442a9d72f9e42f1466f433cb15e187bda3dc14d6729d09e")
  (:PATH "raw/drivers/materialize-2.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize-2.lisp")
   :BYTES 9789 :SHA256
   "42cd226da4210568237b4931938898ab0f61be246a9ce5c65359ad554a1202eb")
  (:PATH "raw/drivers/materialize-2.output.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize-2.output.txt")
   :BYTES 113 :SHA256
   "153f1171b914bfaacd811122e590fa408dca4a7a335cc10618559b842e4ec8e6")
  (:PATH "raw/drivers/materialize-2.stderr.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize-2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize.lisp")
   :BYTES 9790 :SHA256
   "0397c2e83224a2c36c76ce2184d613299c1f0a68daa6e1e3df88d32b9ad68e4e")
  (:PATH "raw/drivers/materialize.output.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/materialize.stderr.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/materialize.stderr.txt")
   :BYTES 20403 :SHA256
   "ccdade6225feaf31a89f69bde9e110f60d7e989832000f22a3cd010ad4d948c8")
  (:PATH "raw/drivers/mutation-before-driver-pin-correction-cb02266f.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation-before-driver-pin-correction-cb02266f.lisp")
   :BYTES 56672 :SHA256
   "ff0420660c7a08e2bfebce35071a3c82df9906028a8b46fc4af08e086930866c")
  (:PATH "raw/drivers/mutation-before-product-final.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation-before-product-final.lisp")
   :BYTES 43403 :SHA256
   "98f948e72909491b047a6aca756c297a944498f97d0012aa622fed065fda1946")
  (:PATH "raw/drivers/mutation-before-product.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation-before-product.lisp")
   :BYTES 43278 :SHA256
   "b779b6aa158027f7c3a4634def3d10d76188bb8d4c19eef8589c61aaafc1fa0f")
  (:PATH "raw/drivers/mutation-driver-pin-correction.patch" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation-driver-pin-correction.patch")
   :BYTES 1145 :SHA256
   "9ddba1a735ecf1bce5b130fd70695a0d394f968b63f95a17807ca3683c2b33d0")
  (:PATH "raw/drivers/mutation-materialization.patch" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation-materialization.patch")
   :BYTES 15427 :SHA256
   "da152657553a8ea22ad41f6475c18fb3bb55c6ead8b80637749eae72ec072554")
  (:PATH "raw/drivers/mutation.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp")
   :BYTES 56672 :SHA256
   "f0a1f433d65476ec740fd2820b0792541926fa82a466f7052d3efeafb7a274e6")
  (:PATH "raw/drivers/nominal-deftest-lines.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/nominal-deftest-lines.txt")
   :BYTES 1557 :SHA256
   "d1db01265184bc008798aa659b292b35586634d1f0cadc43ae4f752f5c0e28ec")
  (:PATH "raw/drivers/nominal-whitelist.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/nominal-whitelist.lisp")
   :BYTES 2626 :SHA256
   "b8334215c71d41cffa40588631572d97d44804093374a579d69b459bdc64780c")
  (:PATH "raw/drivers/read-after-pin-correction.output.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-after-pin-correction.output.txt")
   :BYTES 791 :SHA256
   "205c7455413c3964883fc314952f324d55cff0f936578b65aa1ed016e639a63e")
  (:PATH "raw/drivers/read-after-pin-correction.stderr.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-after-pin-correction.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/read-freeze-2.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze-2.lisp")
   :BYTES 1428 :SHA256
   "2d484833bcd976bca3b890abd54212bfcc5762c31a8c4570ce22cc9e041d76b5")
  (:PATH "raw/drivers/read-freeze-2.output.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze-2.output.txt")
   :BYTES 693 :SHA256
   "753cc1c179a432bcd1a871effdebd98d808bc462082dfbb8392d0f5c436c683e")
  (:PATH "raw/drivers/read-freeze-2.stderr.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze-2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/read-freeze.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze.lisp")
   :BYTES 1410 :SHA256
   "2231b6f475b5d7aa5f7ff06749a198921b7405939c88ed5d08d6d3d7d2662230")
  (:PATH "raw/drivers/read-freeze.output.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/read-freeze.stderr.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-freeze.stderr.txt")
   :BYTES 12312 :SHA256
   "0463cbf388ae381ea73e829e3648479609da313e0740ce9071641796366e5564")
  (:PATH "raw/drivers/read-materialized.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-materialized.lisp")
   :BYTES 1451 :SHA256
   "5022ce9f96acbf7ada44ce15c6839379a83d5ca84a555aa2ac62c260589d06c6")
  (:PATH "raw/drivers/read-materialized.output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-materialized.output.txt")
   :BYTES 791 :SHA256
   "cd1045696e2a30d9ca117ec45f429f51e021ee0f30054e551f41966e3d081394")
  (:PATH "raw/drivers/read-materialized.stderr.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/read-materialized.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/baseline-copy/report.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/baseline-copy/report.lisp")
   :BYTES 522 :SHA256
   "f4bdd7f884cb6d0f418a894cd49094e2cfe4242d259ded78d037d7f7149735c9")
  (:PATH "raw/drivers/selftests/4000996996-worker-78730/baseline-copy/test.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/baseline-transport/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/baseline-transport/report.lisp")
   :BYTES 537 :SHA256
   "184d5bf6e57d5cc8aa12ebdfed7bced183dc38cc77e82188a50af482f0420db6")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/baseline-transport/test.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/completion-exit/test.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/completion-exit/tools/cbor-tag-write-isolated-build.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/completion-exit/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4000996996-worker-78730/report.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/report.lisp")
   :BYTES 1826 :SHA256
   "062dbc40c0fa027244dc79319bbb477d007cc55f06f3f38cd2e1fe60a8d5c870")
  (:PATH "raw/drivers/selftests/4000996996-worker-78730/signal/test.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4000996996-worker-78730/signal/tools/cbor-tag-write-isolated-build.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000996996-worker-78730/signal/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/baseline-copy/report.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/baseline-copy/report.lisp")
   :BYTES 522 :SHA256
   "ece976309cc47cdff68e9f206b83b51155aab09ab9a5198e3a6d6b2d025b6d25")
  (:PATH "raw/drivers/selftests/4000997061-worker-81325/baseline-copy/test.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/baseline-transport/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/baseline-transport/report.lisp")
   :BYTES 537 :SHA256
   "329c39440dccc4715f757937263e834fcf4214902a81f3c209ccd29a39feaccb")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/baseline-transport/test.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/completion-exit/test.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/completion-exit/tools/cbor-tag-write-isolated-build.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/completion-exit/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4000997061-worker-81325/report.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/report.lisp")
   :BYTES 1826 :SHA256
   "2a3363d358d9d77e42d13641b334dcc291a83fcd8a58a9b1e8c3f2a83f66b34c")
  (:PATH "raw/drivers/selftests/4000997061-worker-81325/signal/test.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4000997061-worker-81325/signal/tools/cbor-tag-write-isolated-build.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/selftests/4000997061-worker-81325/signal/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/drivers/target-diffs.output.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs.output.lisp")
   :BYTES 4298 :SHA256
   "5f99bfaba841010e5a42726c6b6050826de124cf464d28e6dc0aa095c72ac5ad")
  (:PATH "raw/drivers/target-diffs.stderr.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/drivers/target-diffs/extra-return-value.after.lisp.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/extra-return-value.after.lisp.txt")
   :BYTES 4432 :SHA256
   "316352e1f9ec977b9352d42fc983eb96d545cff739cf4e3dcc615327f0a47d52")
  (:PATH "raw/drivers/target-diffs/extra-return-value.patch" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/extra-return-value.patch")
   :BYTES 1387 :SHA256
   "1068276a6f26964a33ea3d269e94699e9175ecd7f3c7f2cac65cf2f831ba0b01")
  (:PATH "raw/drivers/target-diffs/overlap-without-header.after.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/overlap-without-header.after.lisp.txt")
   :BYTES 4945 :SHA256
   "25ff57690cd7c1b867fefbc5de3c1ce28b738d731f09898739fb467b4a088128")
  (:PATH "raw/drivers/target-diffs/overlap-without-header.patch" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/overlap-without-header.patch")
   :BYTES 961 :SHA256
   "2fa949b0aaa97107272855c7104f39e359a4ff349eb116148880a44ad32a61a3")
  (:PATH "raw/drivers/target-diffs/physical-capacity.after.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/physical-capacity.after.lisp.txt")
   :BYTES 4941 :SHA256
   "021a7fdc09f25587ee3377d9f8a3814cf0444757bf78580e549d48c065ecc6f9")
  (:PATH "raw/drivers/target-diffs/physical-capacity.patch" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/physical-capacity.patch")
   :BYTES 913 :SHA256
   "05fa36fb5b01ae28f3c817c2809093cfb993f81f0b8f938f3798ffaf5d0ad70a")
  (:PATH "raw/drivers/target-diffs/root-node-excluded.after.lisp.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/root-node-excluded.after.lisp.txt")
   :BYTES 4409 :SHA256
   "9fb13297c180fed824c517084895e269cd2038bcd6b135c156a3625d713951d4")
  (:PATH "raw/drivers/target-diffs/root-node-excluded.patch" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/root-node-excluded.patch")
   :BYTES 896 :SHA256
   "3e291877472257af892f67a4bc0419ac4388a57ce55c97194d704a9add568c75")
  (:PATH "raw/drivers/target-diffs/scan-omitted.after.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/scan-omitted.after.lisp.txt")
   :BYTES 4473 :SHA256
   "f649fec75204caca88ff9ae82c62497a439347cff9b785d7293bc3338eb525d0")
  (:PATH "raw/drivers/target-diffs/scan-omitted.patch" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/scan-omitted.patch")
   :BYTES 1036 :SHA256
   "131c6dcf388345a85955a862bf3c7f0a88ad57ff1cd46899d2ce01c0c009da02")
  (:PATH "raw/drivers/target-diffs/swapped-words.after.lisp.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/swapped-words.after.lisp.txt")
   :BYTES 4414 :SHA256
   "25876f71b662a89ae0034700c757eb76c5163accfb509620805d88f284529a09")
  (:PATH "raw/drivers/target-diffs/swapped-words.patch" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/swapped-words.patch")
   :BYTES 954 :SHA256
   "1c3f45a1a51b5e94675169be567b6739c5238b04d9e2efc67c5a3d47ac2d80ff")
  (:PATH "raw/drivers/target-diffs/tag-depth-charged.after.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/tag-depth-charged.after.lisp.txt")
   :BYTES 4419 :SHA256
   "f512b7c51c8c1fdfaa478e723543501b94b4650d4baf29b2aa22faf2bc173fc7")
  (:PATH "raw/drivers/target-diffs/tag-depth-charged.patch" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/tag-depth-charged.patch")
   :BYTES 904 :SHA256
   "0d9762dd372b3840cfbf4bb6cc46498d8342437487aff3d2296125ecab357ce9")
  (:PATH "raw/drivers/target-diffs/wrong-major.after.lisp.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/wrong-major.after.lisp.txt")
   :BYTES 4414 :SHA256
   "99a4052776c17131243e32809b4f193bf551243cfa82a9569a329c157f9f665d")
  (:PATH "raw/drivers/target-diffs/wrong-major.patch" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/target-diffs/wrong-major.patch")
   :BYTES 950 :SHA256
   "ea7fdaa8994f0a7e51bb01aa9c6339f0d00cfcf81a5557fb3c99e2ab104c71e4")
  (:PATH "raw/drivers/write-target-diffs.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/drivers/write-target-diffs.lisp")
   :BYTES 2617 :SHA256
   "28c99707bcbc941f3ac29e0e747623d4bba7f081129c58a8b9d53e3942d7e572")
  (:PATH "raw/freeze-sources.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/freeze-sources.lisp")
   :BYTES 2815 :SHA256
   "add08e54f2c2d6a7601c7661ba5ed1b6b02bbba67d7fbaba54c7fb3f57dc6a23")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/frozen/docs/implementazione/cbor-tag-decisioni.md.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/implementazione/cbor-tag-decisioni.md.txt")
   :BYTES 9157 :SHA256
   "5068cfff31bc0233f529ee9f28197db30a6d301492621ceccac79c5f0358b0e8")
  (:PATH "raw/frozen/docs/implementazione/cbor-tag-lettura.md.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/implementazione/cbor-tag-lettura.md.txt")
   :BYTES 12370 :SHA256
   "9f582130516234a5caaa5da6b5368a45c3cd007627c78c0fec9101b9604d0dbb")
  (:PATH "raw/frozen/docs/implementazione/cbor-tag-metodo.md.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/implementazione/cbor-tag-metodo.md.txt")
   :BYTES 6287 :SHA256
   "1cede76c0b328fddffcd2ea6c3adf599eb68cf0d19380e6b887f862857413bff")
  (:PATH "raw/frozen/docs/implementazione/cbor-tag-revisione.md.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/implementazione/cbor-tag-revisione.md.txt")
   :BYTES 12612 :SHA256
   "57f09223127b41ca79bf7fa216cf92d06307f2a5ccb8f4f988e793f5ab86fdeb")
  (:PATH "raw/frozen/docs/implementazione/cbor-tag.md.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/implementazione/cbor-tag.md.txt")
   :BYTES 2531 :SHA256
   "151fbd5409c9b70a53788889f2049f8a7efa859640410dfbf8d37ecc6bbc36a2")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 51762 :SHA256
   "99a5a6a5fcf1378e8435dcdbcbce00b705b4aa52aafc805325ca2e052f158466")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 41474 :SHA256
   "edbdedad0ccbaf5205d69aaab4e3ebe99df0e2cd57924f5093726940e6cd6a06")
  (:PATH "raw/frozen/snapshot-index.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/snapshot-index.lisp")
   :BYTES 4105 :SHA256
   "cc2f9d02bd5a32ccbcfe6fb6c9b6e99f5eeec0902c7a6882234a97c06415b844")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-package.lisp")
   :BYTES 737 :SHA256
   "abde362cb324209e1e4b6cb65e433fb351e737e3bb638723754688160561a359")
  (:PATH "raw/frozen/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/frozen/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/frozen/src/codec/cbor-scan.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/frozen/src/codec/cbor-space.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/frozen/src/codec/cbor-string-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/frozen/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/frozen/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/frozen/src/codec/cbor-write.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/frozen/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/frozen/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/frozen/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/frozen/tools/foundation-coverage.lisp")
   :BYTES 22822 :SHA256
   "1fddcda77ddf4281a353f33ac4c5d24ede8fc45d96ec40ed17161740b5cee6c8")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "b73651bb1998e51c2a53d6ccbd50323d274a1464931390de6e27092fab390e47")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "1e891090647649e7547bd97b32fc672aa5d2074fe9904dd6953bae30a31d541a")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "de4a0453fd573a2b01a28ed4b068060124ad4f78400e430cc63780ec12261f29")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "ff6e422537b845bf2b0558c19c1c1eccb71988624a3f07564865b06f358a17e5")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-05.lisp")
   :BYTES 10097 :SHA256
   "2a342384839707c71634e8c0749aef0c8f760af7fd2be7d7e1e2ae37f15cedc6")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-06.lisp")
   :BYTES 24093 :SHA256
   "c07031581f5619bc0572f5619b1fefa1ef0113012346a261026633603b164196")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "533e8fff79c9140b843881d9c61b943d5137b4dda77cff1411eff7ab1cec283b")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-07.lisp.gz")
   :BYTES 410643 :SHA256
   "5fababe2e031020beed10edf1368ca8aa53de1fdc247f1eed45aca01d4c4776a")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "13901aef1871aa753ce523b29fe6f4819a0738076b78c82b9d21a9e892f644cb")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "7836ecda19a6284c79801dd6d3392941e626d05fce91adad55bfb0c8b25eed29")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "bdeaa2bbef7044bff7dd74785d3064c429261a0e5473dc58d8fdae1ad76ab318")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "21068871fe32ef92ef929e33d147bf6571b0d658c2d92c50c3428eca2f134f8c")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/report.lisp")
   :BYTES 318 :SHA256
   "b8c2b2b5d17d4f5a57742ef114488f1ee14f572166cce41d9903d8c5ba980d60")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000997101-check-82864-0/report.lisp.gz")
   :BYTES 466874 :SHA256
   "ae87ae4143a54bb70e8aabd82781d141b3a5b6af2bddc5712408725123ffa9c1")
  (:PATH "raw/mutations/0/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/0/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/src/codec/cbor-tag-input.lisp")
   :BYTES 4941 :SHA256
   "021a7fdc09f25587ee3377d9f8a3814cf0444757bf78580e549d48c065ecc6f9")
  (:PATH "raw/mutations/0/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/test.log")
   :BYTES 33764 :SHA256
   "557ab60c0f5fc678f4d9b3fbc63f34393113447df9d2904906c24a44a5e22932")
  (:PATH "raw/mutations/0/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/0/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/0/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/0/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/0/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/0/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "9c3af1ccf1cb7c06fd8f33b7b50e014e7c04a835f2061afcdc7e607962d4e041")
  (:PATH "raw/mutations/1/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/1/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/1/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "99a4052776c17131243e32809b4f193bf551243cfa82a9569a329c157f9f665d")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/test.log")
   :BYTES 33142 :SHA256
   "31106bcfc8a7402633738cacc5be55164d2c99e9e08f9cff47a4490f7c2e434a")
  (:PATH "raw/mutations/1/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/1/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/1/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/1/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/1/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/1/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "272734229645553d8b58bf4ee2d0c3412b12639f24923090cc83db98a3fb5a26")
  (:PATH "raw/mutations/2/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/2/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/2/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "25876f71b662a89ae0034700c757eb76c5163accfb509620805d88f284529a09")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/test.log")
   :BYTES 33515 :SHA256
   "491154e8c118703bbca3c86177d667c3b1a04e634686bb993ce9d77d39797b5d")
  (:PATH "raw/mutations/2/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/2/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/2/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/2/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/2/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/2/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "0a494500cbc93f6c9b72aac52aa5a665b4188b1c83d3a86702e3b8be30cecd2b")
  (:PATH "raw/mutations/3/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/3/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/3/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/src/codec/cbor-tag-write.lisp")
   :BYTES 4473 :SHA256
   "f649fec75204caca88ff9ae82c62497a439347cff9b785d7293bc3338eb525d0")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/test.log")
   :BYTES 33255 :SHA256
   "9933f9a9460634426c80ddbf20b22ef04ec199521a71ea6a8194e55f04a1f69a")
  (:PATH "raw/mutations/3/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/3/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/3/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/3/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/3/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/3/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "0931750932eab152527974180eb09d3427928919809b89feb2f1716fe7b6c4ae")
  (:PATH "raw/mutations/4/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/4/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/src/codec/cbor-tag-input.lisp")
   :BYTES 4945 :SHA256
   "25ff57690cd7c1b867fefbc5de3c1ce28b738d731f09898739fb467b4a088128")
  (:PATH "raw/mutations/4/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/test.log")
   :BYTES 34165 :SHA256
   "99716f2bbc1b897ed08e37259b434930ff3499b9c3d2f968a1ab3004f423ff0d")
  (:PATH "raw/mutations/4/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/4/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/4/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/4/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/4/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/4/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "fe2b3071df0cf2c24eac886ba3edbd3fa66c04371a70f8e3cacabec7daef53b1")
  (:PATH "raw/mutations/5/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/5/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/5/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/src/codec/cbor-tag-write.lisp")
   :BYTES 4409 :SHA256
   "9fb13297c180fed824c517084895e269cd2038bcd6b135c156a3625d713951d4")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/test.log")
   :BYTES 33903 :SHA256
   "4482590cad8e79d99b4774a266e00ceef33f7900ad3bda77572f823b11a4ae18")
  (:PATH "raw/mutations/5/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/5/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/5/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/5/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/5/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/5/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "0bb205156471b8e59daa68f5160046e8ce2c73d9398c8909142ebeb6332bcbf5")
  (:PATH "raw/mutations/6/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/6/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/6/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/src/codec/cbor-tag-write.lisp")
   :BYTES 4419 :SHA256
   "f512b7c51c8c1fdfaa478e723543501b94b4650d4baf29b2aa22faf2bc173fc7")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/test.log")
   :BYTES 35158 :SHA256
   "12b5cf0f29e23383040d5c4e058020d40309f84906ea3b0129008b7f0dbffea0")
  (:PATH "raw/mutations/6/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/6/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/6/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/6/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/6/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/6/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "507320719ff0518c028472bda324afcdad0b39c3033bb68117aec4f2a52cddc6")
  (:PATH "raw/mutations/7/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/7/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/7/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/src/codec/cbor-tag-write.lisp")
   :BYTES 4432 :SHA256
   "316352e1f9ec977b9352d42fc983eb96d545cff739cf4e3dcc615327f0a47d52")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/test.log")
   :BYTES 33045 :SHA256
   "cc7fa63e8f3917682fba5cde686854fe7544140b9be0b093ad746d0071b5b991")
  (:PATH "raw/mutations/7/tests/codec/cbor-tag-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/7/tests/codec/cbor-tag-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/7/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/7/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/7/tools/cbor-tag-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/7/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "22cdcbd13c19077725f7b76ca9b2c73775189c92e1a95766e4564c09f4df0708")
  (:PATH "raw/mutations/baseline/arcdocdb.asd" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/arcdocdb.asd")
   :BYTES 16814 :SHA256
   "6e09e459d615322d6f051da587b7f7c39a9701a47676e7e60aef052945a928e8")
  (:PATH "raw/mutations/baseline/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations/baseline/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/test.log")
   :BYTES 101301 :SHA256
   "3ae430f1a75b0c29436bf9d04799309b3547fab3b8a650c90356ff64524cb245")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-tag-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7657 :SHA256
   "87694247bf0960e4801c6cca80fc5a8ffb9e34f7264ff5e2236a7b1a4b077a8c")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-tag-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 3927 :SHA256
   "fb30d592241ba2c71d4283241d7053869c761968b26178cee6b94c3934be7f7d")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/mutations/baseline/tools/build.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/baseline/tools/cbor-tag-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/baseline/tools/cbor-tag-write-isolated-build.lisp")
   :BYTES 484 :SHA256
   "612f543b1da4bf109f8541db0d158469c8ef3b5787f3a1687d6b22cd5ff846a4")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/mutations/report.lisp")
   :BYTES 92977 :SHA256
   "05d7af6f9b351c29dc2f23886229ce7567a3ee5bdfda224b9323c5d3a2fd72a7")
  (:PATH "raw/precompile/root-preparation.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/precompile/root-preparation.md.txt")
   :BYTES 1292 :SHA256
   "34643fc62085d6cfdbc79338772e9f1ceb1866b672e056c882554eaac9d0705c")
  (:PATH "raw/reader-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/report.lisp")
   :BYTES 1943 :SHA256
   "f20663a5173a4e1ba9f88f653420dcdd45cef6ed4b646ce0486c5079a9c60811")
  (:PATH "raw/reader-self-test/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-reader-self-test-69697-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/results-draft.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/results-draft.md.txt")
   :BYTES 7573 :SHA256
   "4b21af3512c154a245abdaec4677bbb2ccff86add7a71bee5173dcdebb6f2f6b")
  (:PATH "raw/review/adapt-final-integration-reader.error" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-final-integration-reader.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/adapt-final-integration-reader.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-final-integration-reader.lisp")
   :BYTES 3703 :SHA256
   "76b9a7ebc542e2187b0021629290d1c4ef73469c8cea09b0728046edb595ec5b")
  (:PATH "raw/review/adapt-final-integration-reader.output" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-final-integration-reader.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/adapt-integrated-reader-2.error" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader-2.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/adapt-integrated-reader-2.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader-2.lisp")
   :BYTES 6159 :SHA256
   "7a3f52e1138955f6ed20bf0e1a8f28f3717ca176758ed603ed8b91465fe9bc34")
  (:PATH "raw/review/adapt-integrated-reader-2.output" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader-2.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/adapt-integrated-reader.error" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/adapt-integrated-reader.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader.lisp")
   :BYTES 6138 :SHA256
   "84e85908b210466e84042f516374530fbd8b8880c55c38ec6a19f31fba2381f1")
  (:PATH "raw/review/adapt-integrated-reader.output" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/adapt-integrated-reader.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-data-2.error.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-2.error.txt")
   :BYTES 3495 :SHA256
   "389da79a1f8a39bf29aad3514f06caca499cb3236a99d1ad336c079b9434b3d8")
  (:PATH "raw/review/archive-selection-data-2.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-2.lisp")
   :BYTES 6223 :SHA256
   "7faae665ea97e1776c0bac1423dbd199abebecb77016d1bfa440baeb0b350ac9")
  (:PATH "raw/review/archive-selection-data-2.output.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-2.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-data-3.error.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-3.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-data-3.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-3.lisp")
   :BYTES 6224 :SHA256
   "cfab8b8d4f6999dc3f65000f0df02e96a17028a1a43ecef70147b776e953d6c4")
  (:PATH "raw/review/archive-selection-data-3.output.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data-3.output.txt")
   :BYTES 5048 :SHA256
   "69db60a267a22acbb2e4d8785ee1ad4e4d1900cf98a91556f23761b422a7e6b7")
  (:PATH "raw/review/archive-selection-data.error.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data.error.txt")
   :BYTES 3475 :SHA256
   "8ec51bff50ed7fa3dbb969a60ad95b10af98a82599fc6d9e829c02ec6a565dd8")
  (:PATH "raw/review/archive-selection-data.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data.lisp")
   :BYTES 6223 :SHA256
   "d4582e054249eb685f3c00023cf732f3d86b81d87e85feda4fb20232315051be")
  (:PATH "raw/review/archive-selection-data.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-data.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/archive-selection-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/archive-selection-reading.md")
   :BYTES 7680 :SHA256
   "1ef131abeb166fb091972cad613865f779256bb793ac9231903c99d3a2a4fd5b")
  (:PATH "raw/review/blind-plan.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/blind-plan.md")
   :BYTES 5708 :SHA256
   "f545c9ca6fb04c9c880b08eecceaf21120f12586c89df1660e713afc345be774")
  (:PATH "raw/review/clone-preparation-note.md.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/clone-preparation-note.md")
   :BYTES 808 :SHA256
   "4809fc45acbf103e6cf267ccfec724535ed47a6d3ba0b58da932fa3ba60aaad6")
  (:PATH "raw/review/collection-precompile-reading.md.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/collection-precompile-reading.md")
   :BYTES 8556 :SHA256
   "5c25a83e2fd36f8fcb41abba79caae7f0868ed670d02c6863a2a3514f0caf707")
  (:PATH "raw/review/corpus-preparation-note.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/corpus-preparation-note.md")
   :BYTES 737 :SHA256
   "7fca7841f702f01bd4f48653c7409204175c11b48add0606034f81bd2f918c63")
  (:PATH "raw/review/coverage-classification.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/coverage-classification.lisp")
   :BYTES 6987 :SHA256
   "ce1962502a61d5cbca09f279e8d004afff243cdbac3487f4cedef3afc22915c1")
  (:PATH "raw/review/coverage-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/coverage-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/coverage-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/coverage-reading.lisp")
   :BYTES 14469 :SHA256
   "9794c6dd6f07c334e841690c8974eccfe13cf377d02eeab730e2d3a17daaadbb")
  (:PATH "raw/review/coverage-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/coverage-reading.md")
   :BYTES 9458 :SHA256
   "35095fd686fe0f354aa9f39862960a4258054c3423a9fc16a9fe03fbfb052a22")
  (:PATH "raw/review/coverage-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/coverage-reading.output.txt")
   :BYTES 38027 :SHA256
   "bc6ce229dceef36573f71258411b2440ade312b9a0975dbdf72733064162a126")
  (:PATH "raw/review/drivers-final-reading.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/drivers-final-reading.md")
   :BYTES 6200 :SHA256
   "479c6d8770cb7522aeb5128c1a345dac2950e2370c05e0c68b4ecfcb2915ac46")
  (:PATH "raw/review/drivers-precompile-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/drivers-precompile-reading.md")
   :BYTES 4584 :SHA256
   "d47c591a66c45edd2ce7c65fb53b694a320aaaa8cdc52c1cc7655d19533132ad")
  (:PATH "raw/review/final-integration-reading.error" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/final-integration-reading.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/final-integration-reading.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/final-integration-reading.lisp")
   :BYTES 9752 :SHA256
   "0766f59a0d9b038d50983110827723b2543182f071e4e10c9b2b9722fb8c51ca")
  (:PATH "raw/review/final-integration-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/final-integration-reading.md")
   :BYTES 3927 :SHA256
   "67642b3f0c0df9d79f4c7fd8fa9cd92bf535d0d46fbc966aeaef461cfe29b93b")
  (:PATH "raw/review/final-integration-reading.output" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/final-integration-reading.output")
   :BYTES 3539 :SHA256
   "fa021d62179c51e1bede2e83fc682bcf7c5d624ade8c7d7d2de0fca62504c160")
  (:PATH "raw/review/initial-runtime-reading.error.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/initial-runtime-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/initial-runtime-reading.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/initial-runtime-reading.lisp")
   :BYTES 11617 :SHA256
   "8f197073530bcfb9ddb45031cc7c8e890d9157be539524d744b9b73a0c77d940")
  (:PATH "raw/review/initial-runtime-reading.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/initial-runtime-reading.md")
   :BYTES 4934 :SHA256
   "c17cbd3bd78a98cbd42e0eceed6ac314a030ab7df74b54f870e17c15eeb508ea")
  (:PATH "raw/review/initial-runtime-reading.output.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/initial-runtime-reading.output.txt")
   :BYTES 3614 :SHA256
   "21e497423dc2481b3bf84b7fcebf56a2ec3cc816458553df1bc9b04324318f4c")
  (:PATH "raw/review/integrated-runtime-reading.error" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.error")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.lisp")
   :BYTES 19519 :SHA256
   "5e47b9e2c24f7b09ab644357f53c9ad542f09ca3f1dc29a87873723d60bc6f86")
  (:PATH "raw/review/integrated-runtime-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.md")
   :BYTES 8162 :SHA256
   "a8c51cce35f452c52b829e30c17a35ec911b6fa7aac260bf369c687c842fa40b")
  (:PATH "raw/review/integrated-runtime-reading.output" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.output")
   :BYTES 7430 :SHA256
   "b2b2443c58ea2cb66e583c69a4da23a35c2f2d8a3c7cfed7eb3eba154d8ff116")
  (:PATH "raw/review/integrated-runtime-reading.preliminary-2.error" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary-2.error")
   :BYTES 25095 :SHA256
   "9f43da2e17e19704cfc2fcaaf691629617f54616f9fb4d2ebadd68bd8887c337")
  (:PATH "raw/review/integrated-runtime-reading.preliminary-2.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary-2.lisp")
   :BYTES 19519 :SHA256
   "d6eba222262b382b0b458a9e2cfa0df97be279fb98dade98c4827d4ad9773c7d")
  (:PATH "raw/review/integrated-runtime-reading.preliminary-2.output" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary-2.output")
   :BYTES 4011 :SHA256
   "1767d9f55ac7069ac0cf05b210922c0e132b0a3475998b56db138268f9c55674")
  (:PATH "raw/review/integrated-runtime-reading.preliminary.error" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary.error")
   :BYTES 3524 :SHA256
   "8c6766470079bae0c488e008a39abde29fcea71dc4e63f362f4c94537f5eb562")
  (:PATH "raw/review/integrated-runtime-reading.preliminary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary.lisp")
   :BYTES 13019 :SHA256
   "eb9cb79be4a6ea32b64acc7facd33c28fa3e5eae59cbe5b928cb684e03cfb13a")
  (:PATH "raw/review/integrated-runtime-reading.preliminary.output" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.preliminary.output")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-baseline-data.error.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-baseline-data.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-baseline-data.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-baseline-data.lisp")
   :BYTES 1944 :SHA256
   "04a3e13804312b94b965512d79c11d1d1529696a3cb195bdac6d646a5a8eb73b")
  (:PATH "raw/review/mutation-baseline-data.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-baseline-data.output.txt")
   :BYTES 150 :SHA256
   "63b7ff0529038efe629590cfe0734db9448427c2b4821c55b1d6663a2316fbea")
  (:PATH "raw/review/mutation-reading-2.error.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-2.error.txt")
   :BYTES 19536 :SHA256
   "84a0616bf450f7afc3e7555971361d12f8c07fa092689649cbe125a56b5966fe")
  (:PATH "raw/review/mutation-reading-2.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-2.lisp")
   :BYTES 20144 :SHA256
   "bf2aa8177f776d8e9c0f36e155ed50a074fefe72723f148cbeddc51e843dffd4")
  (:PATH "raw/review/mutation-reading-2.output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-2.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-reading-3.error.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-3.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-reading-3.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-3.lisp")
   :BYTES 20534 :SHA256
   "122f379e71624329590021940600203433ecee299c623de6c7176c5c6a103be1")
  (:PATH "raw/review/mutation-reading-3.output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-3.output.txt")
   :BYTES 16268 :SHA256
   "5d8946824274d5d726025355078164270307b2933f43cbe573b0c7f43b95bf38")
  (:PATH "raw/review/mutation-reading-diagnostic.error.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-diagnostic.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-reading-diagnostic.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-diagnostic.lisp")
   :BYTES 1166 :SHA256
   "c326f3a1bca5bdf45244390d1874f713cfe896dbb5882d8f832fc51f4e293a3f")
  (:PATH "raw/review/mutation-reading-diagnostic.output.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading-diagnostic.output.txt")
   :BYTES 11480 :SHA256
   "34b38ed24dddf30f96e7dec7a09e2141ef3d1e91124c568e3a55a8956ed87e97")
  (:PATH "raw/review/mutation-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading.error.txt")
   :BYTES 19568 :SHA256
   "cbce33e0c0eca5692eaf246709ada284d4a2f640595bd2951e21dd236dd63750")
  (:PATH "raw/review/mutation-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading.lisp")
   :BYTES 20144 :SHA256
   "3c15cdb5c84c1b3141172bb1f13e69a5320d68835ba7fdb8d14b6a93c9a62752")
  (:PATH "raw/review/mutation-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading.md")
   :BYTES 10808 :SHA256
   "255e22c481965a62629f65ebeb3049f6bc927469ee6045cabbf1cf4f79fdef4a")
  (:PATH "raw/review/mutation-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/mutation-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepare-coverage-reading.error.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/prepare-coverage-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepare-coverage-reading.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/prepare-coverage-reading.lisp")
   :BYTES 4644 :SHA256
   "37b91f7db2aeaffb54c7f1b753408463cd83ed25011f37871794657546933d79")
  (:PATH "raw/review/prepare-coverage-reading.output.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/prepare-coverage-reading.output.txt")
   :BYTES 159 :SHA256
   "0b6897f11960209369cbb5793606f51599b4c1576dce9e51d9cd950caa15fbe4")
  (:PATH "raw/review/prepare-mutation-reading.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/prepare-mutation-reading.lisp")
   :BYTES 2594 :SHA256
   "99514b38e66c89828d01142ca64800cba03e21560e72e5f7589ebf8b5330289f")
  (:PATH "raw/review/read-corpus.final-output.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-corpus.final-output.txt")
   :BYTES 1771 :SHA256
   "4593fa21c41f9ce8845d51c4534e870863570b294b7639b42492329a7b37870b")
  (:PATH "raw/review/read-corpus.final-stderr.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-corpus.final-stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-corpus.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-corpus.lisp")
   :BYTES 1964 :SHA256
   "cf44decc87205cbc5cda17c91b7e30bbba6dbfe7967d0946f0bbcc5dd710e0e8")
  (:PATH "raw/review/read-corpus.output.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-corpus.output.txt")
   :BYTES 1771 :SHA256
   "4593fa21c41f9ce8845d51c4534e870863570b294b7639b42492329a7b37870b")
  (:PATH "raw/review/read-corpus.stderr.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-corpus.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-product-decisions.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-product-decisions.lisp")
   :BYTES 2969 :SHA256
   "ecf55f8176c7370abe118d9e289e1cac2cfd9ee6deac79c9799f5496909dfd45")
  (:PATH "raw/review/read-product-decisions.output.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-product-decisions.output.txt")
   :BYTES 945 :SHA256
   "2caa4de949e531ac4496d7f514529d4bb753350c4f2b6d0a0514439faa56ed3c")
  (:PATH "raw/review/read-product-decisions.stderr.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-tag-write-20261014/review/read-product-decisions.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test/completion-exit/stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/completion-exit/stdout.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/report.lisp")
   :BYTES 1961 :SHA256
   "dfe9eadfdbe36fd0f3b958fd17268b8f1ef0ceb38369a2e28b2a39fbfc309762")
  (:PATH "raw/snapshot-self-test/signal/isolated-build.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000996874-snapshot-self-test-69641-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "processes/manifest-preparation/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998190-command-9510-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "9223511af1057abee3dd0667cd72b2a0775df50dd03c4151e0b92ceff3bfc7b8")
  (:PATH "processes/manifest-preparation/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998190-command-9510-0/report.lisp")
   :BYTES 189859 :SHA256
   "a340bc37305a581229a7c2eb5928035571c661e14eada4ca0b5fe5c6105e2184")
  (:PATH "processes/archive-preflight/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998201-command-9580-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "0b7ac1e8784ac64aa67d18bec0300cde63000567341ea73ab381a2069a26983b")
  (:PATH "processes/archive-preflight/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998201-command-9580-0/report.lisp")
   :BYTES 190625 :SHA256
   "68c266ba45a744d0a2baed9479daf70dd43b6e2c1f3251028020817e50555f00")
  (:PATH "processes/parallel-collection/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998211-command-9692-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "6529c0020d924ad5ea2adf2454d99b9d55c49f6ca46f34fb24305710d4a0be06")
  (:PATH "processes/parallel-collection/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998211-command-9692-0/report.lisp")
   :BYTES 189505 :SHA256
   "a0c4014545e6f4cf6b71b1c1b442caa2d4e756b311b1db6ae923708b3132a7f1")
  (:PATH "processes/collection-data-reading/closed-check-original.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/closed-check-original.log")
   :BYTES 5523 :SHA256
   "117068811ad2c7c6af27dc24f72feea7447e6b576aca5fd3a2ca834d2d23a42f")
  (:PATH
   "processes/collection-data-reading/collection-observation-original.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/collection-observation-original.lisp")
   :BYTES 142846 :SHA256
   "05b2ca0fb1f0dff00f4b10d9dfb90f7f8101132332cae096f5c2b66353363d9e")
  (:PATH "processes/collection-data-reading/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "077540c7cabd09eb3a7ca4a5e5b399cf3d9fbf769ac5acf016676704b5d6e59a")
  (:PATH "processes/collection-data-reading/preserve-originals-tool.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/preserve-originals-tool.lisp")
   :BYTES 2120 :SHA256
   "a63aae561ead1cf2dd23570050176b156976f5e9b03812fab82d5509aacabc3b")
  (:PATH
   "processes/collection-data-reading/preserved-collection-originals.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/preserved-collection-originals.lisp")
   :BYTES 1608 :SHA256
   "68e47d7d332486fe79d7aa6b2aa5ea8942729bec32eac6d5b4d2f9c9d95245d7")
  (:PATH "processes/collection-data-reading/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998324-command-11981-0/report.lisp")
   :BYTES 343272 :SHA256
   "0c51b29fc08f68d45d2fb810240611cf8d3fb2be4eac9869f81ff11072ad645e")
  (:PATH "processes/preserve-collection-originals/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998336-command-12090-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "226bcc2679110367d321570b76a9102d195a3ce11e183136c1f7a4da20e8f3b9")
  (:PATH "processes/preserve-collection-originals/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000998336-command-12090-0/report.lisp")
   :BYTES 191236 :SHA256
   "ac9fe3a6c29249dce5760366d573ae4f3e5ef55918ba021588a9f0f5da94a2cb"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
