(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((14) BASE-CHAR . "freeze-sources") :RECORD-PATH
   "processes/freeze-sources/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((54) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/freeze-sources.lisp")))
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
       . "spikes/out/cbor-map-write-20261014/drivers/bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((15) BASE-CHAR . "audit-self-test") :RECORD-PATH
   "processes/audit-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/drivers/audit.lisp")
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
       . "spikes/out/cbor-map-write-20261014/coverage-self-test/")))
  (:LABEL #A((20) BASE-CHAR . "collection-self-test") :RECORD-PATH
   "processes/collection-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/self-test/")))
  (:LABEL #A((5) BASE-CHAR . "bench") :RECORD-PATH
   "processes/bench/report.lisp" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/drivers/bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((16) BASE-CHAR . "bench-data-audit") :RECORD-PATH
   "processes/bench-data-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/drivers/audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((49) BASE-CHAR . "spikes/out/4000985967-command-68300-0/report.lisp")
    #A((40) BASE-CHAR . "d7a593badeb6e6b71f28dc4e80c641b07189d0b8")
    #A((40) BASE-CHAR . "22e814ea68e606c5bc58033c2a31e945303a9d65")))
  (:LABEL #A((12) BASE-CHAR . "coverage-map") :RECORD-PATH
   "processes/coverage-map/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((44) BASE-CHAR . "spikes/out/cbor-map-write-20261014/coverage/")
    #A((14) BASE-CHAR . "cbor-map-write")))
  (:LABEL #A((18) BASE-CHAR . "mutation-self-test") :RECORD-PATH
   "processes/mutation-self-test/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/drivers/mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((17) BASE-CHAR . "mutation-campaign") :RECORD-PATH
   "processes/mutation-campaign/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/drivers/mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((45) BASE-CHAR . "spikes/out/cbor-map-write-20261014/mutations/")))
  (:LABEL #A((16) BASE-CHAR . "integrated-check") :RECORD-PATH
   "processes/integrated-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((20) BASE-CHAR . "coverage-compression") :RECORD-PATH
   "processes/coverage-compression/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((44) BASE-CHAR . "spikes/out/cbor-map-write-20261014/coverage/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")
    #A((21) BASE-CHAR . "--minimum-age-seconds") #A((1) BASE-CHAR . "0")))
  (:LABEL #A((40) BASE-CHAR . "final-integration-build-lint-trace-links")
   :RECORD-PATH
   "processes/final-integration-build-lint-trace-links/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links")))
  (:LABEL #A((19) BASE-CHAR . "archive-preparation") :RECORD-PATH
   "processes/archive-preparation/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/prepare-archive.lisp")))
  (:LABEL #A((17) BASE-CHAR . "archive-preflight") :RECORD-PATH
   "processes/archive-preflight/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/preflight-archive.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/manifest.lisp")
    #A((13) BASE-CHAR . "--destination")
    #A((41) BASE-CHAR . "spikes/results/2026-10-14-cbor-map-write/")
    #A((8) BASE-CHAR . "--report")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/preflight.lisp")))
  (:LABEL #A((18) BASE-CHAR . "archive-collection") :RECORD-PATH
   "processes/archive-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((58) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/manifest.lisp")
    #A((41) BASE-CHAR . "spikes/results/2026-10-14-cbor-map-write/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((20) BASE-CHAR . "archive-data-reading") :RECORD-PATH
   "processes/archive-data-reading/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((66) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/read-collection.lisp")
    #A((92) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/collection-observation-4000988538-31112-0.lisp")
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/closed-check-4000988586-31112-0.log")))
  (:LABEL #A((29) BASE-CHAR . "archive-original-preservation") :RECORD-PATH
   "processes/archive-original-preservation/report.lisp" :STATUS :OK :EXIT-CODE
   0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/preserve-originals.lisp")
    #A((92) BASE-CHAR
       . "spikes/out/cbor-map-write-20261014/collection/collection-observation-4000988538-31112-0.lisp")
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/closed-check-4000988586-31112-0.log")
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/report.lisp"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/manifest.lisp")
   :BYTES 50318 :SHA256
   "b83bbc75c685216ee60fdf1b5e9c676f6d940f5f15872fa31fe35daf46c69c24")
  (:PATH "collection-source.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "processes/audit-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64056-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "c278910567a3bf643f550086349343755aade27a9d860b90756203f83a8546e8")
  (:PATH "processes/audit-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64056-0/report.lisp")
   :BYTES 182265 :SHA256
   "9865c55be511d7a635684ace10c3730cc01737f70b87a9f63d054173ffba9f11")
  (:PATH "processes/bench-data-audit/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71953-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "8074c11d603bcf391942c454d1201e956341deac444952ac217d9382c9f97122")
  (:PATH "processes/bench-data-audit/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71953-0/report.lisp")
   :BYTES 180181 :SHA256
   "44e4413f4df3acc8a1152f2697a88fcb578faee8336b0a6726aca5131ac0ff5a")
  (:PATH "processes/bench-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64059-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "00049b251b1944956d1e1bb51beee27ec5af7ea962008b03979e7ce579474a9d")
  (:PATH "processes/bench-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64059-0/report.lisp")
   :BYTES 225085 :SHA256
   "35d344743868f7f26041f3f8b03fdc5e71aa80199bd5718d71e7a3eafa7ea96e")
  (:PATH "processes/bench/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985967-command-68300-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "0d70a377d7c433047fa2c2dac63255b60006607ea28523b0044e9251311fcffe")
  (:PATH "processes/bench/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985967-command-68300-0/report.lisp")
   :BYTES 244022 :SHA256
   "a2f90aa9c1e2654b96657682e87985efe74a2e6c1ca44ef99ed2a0c2018eb5d0")
  (:PATH "processes/collection-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64061-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "00acf7165289c5b239a3d4dd7148789c56cd26927fae6c6de6af44cb70096d2a")
  (:PATH "processes/collection-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64061-0/report.lisp")
   :BYTES 179119 :SHA256
   "a37e7c871130e60234e8235fed8a0ba5526a01dea9b1fd7a041e1c31d72e6dbc")
  (:PATH "processes/coverage-compression/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986883-command-89136-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "7ff44e3114aa953119c5d7e722e4b9bcfcc029a18365e8c38cd6e38bc87c0737")
  (:PATH "processes/coverage-compression/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986883-command-89136-0/report.lisp")
   :BYTES 179463 :SHA256
   "23a41015c430ef2727182a58afdc703e322149597cc7c99f2a94edb2ff6048b8")
  (:PATH "processes/coverage-map/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71952-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "5e208a99aa214f13a0742175bf3351cf06ca962376d4565f48f4626a3e164cea")
  (:PATH "processes/coverage-map/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71952-0/report.lisp")
   :BYTES 180421 :SHA256
   "153aadf1c7b7f8d1c00021553f1f1336507b144300b600c7e36a40e16e16eb16")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64058-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "7964775a2f3deef7571fe1e9c5736d62d382ee33094ad4a72dde44b8629a1af4")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985856-command-64058-0/report.lisp")
   :BYTES 178330 :SHA256
   "f66c3a1060adb84bf21fa50fd967c51f8de7531ff0a371aa3eb2560f70245fd3")
  (:PATH
   "processes/final-integration-build-lint-trace-links/conservazione.lisp"
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "57d3691329e85dacd6b1df0dc804ceade4621a563ffb1484d85a32d6c5cb902d")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp"
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/report.lisp")
   :BYTES 317 :SHA256
   "bf74f5952898a69e4a964a1d61ad7d2d9d3e0e3be11f7883b8dbfbcb501f3ef6")
  (:PATH "processes/final-integration-build-lint-trace-links/report.lisp.gz"
   :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000987886-command-16580-0/report.lisp.gz")
   :BYTES 138750 :SHA256
   "1e383482c9124a160f8105faf2530fdfea346ed944612439c22312c4c5b0b496")
  (:PATH "processes/freeze-sources/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985634-command-58574-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "5fe2418915709ca221280593d66fb10879f2c94830686d463dcb0dfa3f0f0a93")
  (:PATH "processes/freeze-sources/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985634-command-58574-0/report.lisp")
   :BYTES 178239 :SHA256
   "29edbf3e46b7e7b2899148d9b180e1e6640186aaeaf49feb66c491061e5ebf6c")
  (:PATH "processes/initial-build-lint-trace-links/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/conservazione.lisp")
   :BYTES 1735 :SHA256
   "36d453979569564ad89509b73f30a40c7a3c1c04055be7f2c66d1ae9240656a6")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/report.lisp")
   :BYTES 317 :SHA256
   "379c3632670eecc48ce4ac41be66ff1991f50a408453d92b76730f64694eb543")
  (:PATH "processes/initial-build-lint-trace-links/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000985658-command-59509-0/report.lisp.gz")
   :BYTES 137522 :SHA256
   "f947867acbb149f5f0aca9235b18e2b70a5b5b8a28adca9f1538711cd883be97")
  (:PATH "processes/integrated-check/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/conservazione.lisp")
   :BYTES 1734 :SHA256
   "532b076e1bdc65aab73e989c3994456648b9c156596eaa0b52204ef25c2d0205")
  (:PATH "processes/integrated-check/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/report.lisp")
   :BYTES 317 :SHA256
   "7456d4826398615c278eabcdee760ef508e33a5604b4cd72accd8356c9198240")
  (:PATH "processes/integrated-check/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986074-command-71976-0/report.lisp.gz")
   :BYTES 144099 :SHA256
   "69c311e9cdf6527c4a029ca3c9ba152e537ffd16e0105e61cd123953dc00b660")
  (:PATH "processes/mutation-campaign/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986535-command-85304-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "b4c7ffc1abd548ed941367935ea19f516ee14a68e003cf9610dbdda1a2fab604")
  (:PATH "processes/mutation-campaign/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986535-command-85304-0/report.lisp")
   :BYTES 271126 :SHA256
   "e34228e309d3c9a84783463aa7dc52d434d6f14c275e683e4cc8efacd3ea6df7")
  (:PATH "processes/mutation-self-test/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986246-command-76796-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "6b9fc315e6d461aff89cd5676b4129d9eb01208a4592617eb703d42f8877baa8")
  (:PATH "processes/mutation-self-test/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986246-command-76796-0/report.lisp")
   :BYTES 268321 :SHA256
   "d7b297b29b0c95d81ee1e2e5d8dfab70e1256757352a3bc9c9c7eea4078fae16")
  (:PATH "raw/collection-self-test/corrupt/collection-manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "52af9876d77f9b87ecfbb55d05acdd4694219da2c1b8bc6072ae7d0dfa0e6cb8")
  (:PATH "raw/collection-self-test/corrupt/collection-source.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/collection-source.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection-self-test/corrupt/processes/synthetic/report.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "4648873d1757e47c894b7359c1685f67877133ee4baed81040b49a32b3e9062e")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file00.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file01.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file02.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file03.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file04.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file05.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file06.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file07.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file08.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file09.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file10.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file11.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file12.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file13.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/corrupt/raw/fixtures/file14.bin" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/corrupt/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/input/duplicate.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/duplicate.lisp")
   :BYTES 635 :SHA256
   "fa5fd09810c8a650ec00226e0e1c3c4c1bb3557acd77519636329d4928282d1e")
  (:PATH "raw/collection-self-test/input/manifest.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/manifest.lisp")
   :BYTES 436 :SHA256
   "52af9876d77f9b87ecfbb55d05acdd4694219da2c1b8bc6072ae7d0dfa0e6cb8")
  (:PATH "raw/collection-self-test/input/process/report.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/input/tree/file00.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/input/tree/file01.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/input/tree/file02.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/input/tree/file03.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/input/tree/file04.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/input/tree/file05.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/input/tree/file06.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/input/tree/file07.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/input/tree/file08.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/input/tree/file09.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/input/tree/file10.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/input/tree/file11.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/input/tree/file12.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/input/tree/file13.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/input/tree/file14.bin" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection-self-test/report.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/report.lisp")
   :BYTES 798 :SHA256
   "90a47fd308edec3cd25c40e8e1a5f0bd8a9e9f1035a0569721e9b8f0e77050c8")
  (:PATH "raw/collection-self-test/valid/archive-index.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/archive-index.lisp")
   :BYTES 6020 :SHA256
   "c74381c49d9a31051b7fb6acc88715ef9c9a0ded0e4b17afc69d5f5b1373b0e5")
  (:PATH "raw/collection-self-test/valid/catalogo.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/catalogo.lisp")
   :BYTES 406 :SHA256
   "7b3853df8d52d8e72a6a8fa602a15f830adf6c3a7f32e7618dd63d1fe445a0bf")
  (:PATH "raw/collection-self-test/valid/collection-manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/collection-manifest.lisp")
   :BYTES 436 :SHA256
   "52af9876d77f9b87ecfbb55d05acdd4694219da2c1b8bc6072ae7d0dfa0e6cb8")
  (:PATH "raw/collection-self-test/valid/collection-source.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/collection-source.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection-self-test/valid/processes/synthetic/report.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file00.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file01.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file02.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file03.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file04.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file05.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file06.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file07.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file08.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file09.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file10.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file11.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file12.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file13.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/collection-self-test/valid/raw/fixtures/file14.bin" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/self-test/valid/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/collection/append.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/append.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/collection/build-manifest.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/build-manifest.lisp")
   :BYTES 12551 :SHA256
   "87f5b112ac507188b72e343c38279ebf4789ed1018f99aa7f0e99bf84732530e")
  (:PATH "raw/collection/closed-check-4000985865-64200-0.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/closed-check-4000985865-64200-0.log")
   :BYTES 958 :SHA256
   "f98f10e6659172ccbbab5a2302ff4391d5b6043966605a6ed791957d6a80ccb6")
  (:PATH "raw/collection/collect.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "ed4cadf6816c0b192d55165da0cd032db242af74173f4769a68d656050305fe5")
  (:PATH "raw/collection/collection-observation-4000985860-64200-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collection-observation-4000985860-64200-0.lisp")
   :BYTES 6698 :SHA256
   "5fb5e36af5d028b1a1d829538453b804b3c27a09aa2a2a778778f9bc0708f3d6")
  (:PATH "raw/collection/collection-observation-4000985869-64200-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collection-observation-4000985869-64200-0.lisp")
   :BYTES 6621 :SHA256
   "a2d63a0561b92a4faa5203116de0111bf55b37a0ac8adfd434e13a3f948d766d")
  (:PATH "raw/collection/collection-observation-4000985873-64200-0.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collection-observation-4000985873-64200-0.lisp")
   :BYTES 560 :SHA256
   "5afcdc1ec258b46056716ac5cbdbf982986e9252d1db7e8483773686005bf1f3")
  (:PATH "raw/collection/collection-observation-4000985873-64200-1.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/collection-observation-4000985873-64200-1.lisp")
   :BYTES 409 :SHA256
   "c5849d3ffc04c7f9d0aa267a4c882320ab076412202d16d7c95cecd807ded02e")
  (:PATH "raw/collection/preflight-archive.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/preflight-archive.lisp")
   :BYTES 16434 :SHA256
   "df37bf1e745a152d50cdbfdafefc9c4ae524bccfe1d853fd414738c3294d217a")
  (:PATH "raw/collection/prepare-archive.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/prepare-archive.lisp")
   :BYTES 5253 :SHA256
   "908e1773848494de1c7375634978624fe72b03abaf6220d30f06f768073396d2")
  (:PATH "raw/collection/read-collection.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/collection/read-collection.lisp")
   :BYTES 1824 :SHA256
   "7739a12c824027a86bb47e135fbe2c4b17278068c83d517e4e2cc75abb342083")
  (:PATH "raw/coverage-self-test/28f84feea79880b3eac7ab57adb359ee.html" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage-self-test/28f84feea79880b3eac7ab57adb359ee.html")
   :BYTES 2837 :SHA256
   "cb48aa4e927c62c21a6ac2fc8eecc0947f81ccd41bd810a2f4cc928610f77e19")
  (:PATH "raw/coverage-self-test/cover-index.html" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage-self-test/cover-index.html")
   :BYTES 1797 :SHA256
   "25b50ac87fbe8a7a2ea4d001bb1f8ca094daa70425bfa13bb24463fcfce492d6")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/2fb515269f85c825099af6b098f75c7e.html" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage/2fb515269f85c825099af6b098f75c7e.html")
   :BYTES 46304 :SHA256
   "179e89f86acd77baffd8c93cc729fc9f6a3d565c9ba1a1c2d4b92c8e9f7cf5d4")
  (:PATH "raw/coverage/c791897292bea4a710625f49c927786c.html" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage/c791897292bea4a710625f49c927786c.html")
   :BYTES 39331 :SHA256
   "6e78f1f28955c59e4ad23cce9a8dc079a0e049516673f28071479d6b81c5e814")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage/cover-index.html")
   :BYTES 1951 :SHA256
   "2309dc1a249f6a166018153520fab6a0e87900c3d2b178294cf2400241afb2af")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "5eaab0ed0f6d8e0d4261d2e611f4b64e91db9525c6eccfa3deeb3b3ab945aef0")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/coverage/coverage-state.lisp.gz")
   :BYTES 363928 :SHA256
   "29b4af17deaa19f593f90ab589c7390f1a4779def2464dc7516f2747e6f2e583")
  (:PATH "raw/drivers/audit.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/audit.lisp")
   :BYTES 43128 :SHA256
   "706c113729fa42df764120aa3cbd687af6fea7967064abef7d440a4fc46e554e")
  (:PATH "raw/drivers/bench.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/bench.lisp")
   :BYTES 15618 :SHA256
   "8f18cbdde578b6edacc3c1fdb9af93d1173dbae806f605f5af6059dfc735e2eb")
  (:PATH "raw/drivers/catalogue-before-product-b07f7414.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/catalogue-before-product-b07f7414.lisp")
   :BYTES 761 :SHA256
   "b6ababe58ae038a7d3d4a087205f2156f2f6a6983bb25a9d5a2ca0318b528d03")
  (:PATH "raw/drivers/catalogue-materialized.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/catalogue-materialized.lisp")
   :BYTES 12224 :SHA256
   "f9a00746bb096f96e577e09b4901416db69cf6850a525319af073fe22a2ce2a7")
  (:PATH "raw/drivers/driver-history-before-material-5a140430.md.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/driver-history-before-material-5a140430.md.txt")
   :BYTES 3377 :SHA256
   "48d9ba45ad7540693050fbc38911ba65df2f08e44ae03d36b5d77dadfbaca392")
  (:PATH "raw/drivers/driver-history.md.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/driver-history.md")
   :BYTES 6128 :SHA256
   "10e0165c1b3d52d6a9ef795662079e4471918ebc02bd158837f360b842e37f0a")
  (:PATH "raw/drivers/fixtures-and-mutations.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/fixtures-and-mutations.lisp")
   :BYTES 2127 :SHA256
   "c203f5f8288af72c60960d65b5a1cd5c4e7d21d9029d1180042ea51db3f41374")
  (:PATH "raw/drivers/mutation-before-product-cff90018.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/mutation-before-product-cff90018.lisp")
   :BYTES 42828 :SHA256
   "c230eed646ec51c0e8add90a71419cca6e6a011cd377288547728fdd83571a37")
  (:PATH "raw/drivers/mutation.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/mutation.lisp")
   :BYTES 53739 :SHA256
   "fbd8ffdaa941d2f2d90d71b0733bcb1317c58b9ba2c9f79f9aa3d022a1c2d603")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/baseline-copy/report.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/baseline-copy/report.lisp")
   :BYTES 522 :SHA256
   "18653a24842520571b3fe7f0ae98624aece1f088670bf9f046198ca224964679")
  (:PATH "raw/drivers/selftests/4000986247-worker-76858/baseline-copy/test.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/baseline-transport/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/baseline-transport/report.lisp")
   :BYTES 537 :SHA256
   "6bf3e8ad73a9d191185b4fb4cb197d955e648efa7c45a133bbbba9af821f333c")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/baseline-transport/test.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/completion-exit/test.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/completion-exit/tools/cbor-map-write-isolated-build.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/completion-exit/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4000986247-worker-76858/report.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/report.lisp")
   :BYTES 1826 :SHA256
   "abe0f29553df057b41357a798471ab5221173ea91291d7b0843d8b74a2b4e911")
  (:PATH "raw/drivers/selftests/4000986247-worker-76858/signal/test.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4000986247-worker-76858/signal/tools/cbor-map-write-isolated-build.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986247-worker-76858/signal/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/baseline-copy/report.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/baseline-copy/report.lisp")
   :BYTES 522 :SHA256
   "9c68c64bc2df349b1e8de0db3512a13d475c93eaa2af2551e79f4653361ae0ee")
  (:PATH "raw/drivers/selftests/4000986537-worker-85328/baseline-copy/test.log"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/baseline-transport/report.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/baseline-transport/report.lisp")
   :BYTES 537 :SHA256
   "b513f9d9b77e7a460b546f1ab6de983e38bd74e2d8612538565c69a06a054a7d")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/baseline-transport/test.log"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/completion-exit/test.log"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/completion-exit/tools/cbor-map-write-isolated-build.lisp"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/completion-exit/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/drivers/selftests/4000986537-worker-85328/report.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/report.lisp")
   :BYTES 1826 :SHA256
   "dbd43a43d4bc0785e0a37c21bc276da67b262db0eac60a2739bc1ec8abd8efe4")
  (:PATH "raw/drivers/selftests/4000986537-worker-85328/signal/test.log"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/drivers/selftests/4000986537-worker-85328/signal/tools/cbor-map-write-isolated-build.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/drivers/selftests/4000986537-worker-85328/signal/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/freeze-sources.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/freeze-sources.lisp")
   :BYTES 2815 :SHA256
   "e7ae082f9335a3c09bd30165529c3f1a82b968e517d85fd3829cf8de551bd0d8")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/frozen/docs/implementazione/cbor-map-decisioni.md.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/implementazione/cbor-map-decisioni.md.txt")
   :BYTES 9177 :SHA256
   "40af0fa5867d554234f1e4824f77e89f60822638fff4bc43993686cd673a6189")
  (:PATH "raw/frozen/docs/implementazione/cbor-map-lettura.md.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/implementazione/cbor-map-lettura.md.txt")
   :BYTES 13055 :SHA256
   "6efd9001a966af30ae0d221c9b1786a0af7cc100e988e6e059af58cdabbc42eb")
  (:PATH "raw/frozen/docs/implementazione/cbor-map-metodo.md.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/implementazione/cbor-map-metodo.md.txt")
   :BYTES 6639 :SHA256
   "f4b6cc9db71d892295b94e9a9459dab6a61e082714ffba42e09c5a7d5453d4d6")
  (:PATH "raw/frozen/docs/implementazione/cbor-map-revisione.md.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/implementazione/cbor-map-revisione.md.txt")
   :BYTES 8378 :SHA256
   "f9a7a7ae708852f62134cf6f800036e1ef88d1abf82fba16e07ceb6b971d6fcc")
  (:PATH "raw/frozen/docs/implementazione/cbor-map.md.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/implementazione/cbor-map.md.txt")
   :BYTES 3151 :SHA256
   "18d6540632b343191369ce8e1adab5568327740da77a1c25a12229a9b2c027d0")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 51029 :SHA256
   "1ab934531457dd0a86857e42413ec69d3712b852bfac56dba992fe496473838b")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 40938 :SHA256
   "921f08c9b001ce26611d2729831567af4969dcccaeba8161ab04da3b58603709")
  (:PATH "raw/frozen/snapshot-index.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/snapshot-index.lisp")
   :BYTES 4104 :SHA256
   "c5375c2eb3b3e996b63556f1d0fa86e16f9d6f80f52b55538162d161fa8ea929")
  (:PATH "raw/frozen/src/codec/cbor-map-input.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/frozen/src/codec/cbor-map-write.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-package.lisp")
   :BYTES 712 :SHA256
   "0988e0fc5b84d1afd23a1d70077e1170ca8ab4bcc39d44b4b0bf50a1cfb2ea3e")
  (:PATH "raw/frozen/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/frozen/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/frozen/src/codec/cbor-scan.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/frozen/src/codec/cbor-space.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/frozen/src/codec/cbor-string-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/frozen/src/codec/cbor-write.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/frozen/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/frozen/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/frozen/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/frozen/tools/foundation-coverage.lisp")
   :BYTES 20787 :SHA256
   "66d05ff24b94b1f00f7b46d7d17f2cd5c3fb9d12ef683347df50b367b5bd9b53")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "56e63b1901e819a3f7d33d5752b2a91813c77199834e12fbcda495a2e45e996e")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "b9b3dad60ab2244f95d1715c0c0f093d3df46fe50092c3c50cc8d19ca2695a5c")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "34885cf4d607dddbf359216291ab657d2d50b08fdfda75357585709b8c550805")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "0e7f514c5dd131ed32bdd09938fa119c11cbadba5a268e5ac446f19b27ada425")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-05.lisp")
   :BYTES 10150 :SHA256
   "b02971535d297e1c3a15875d055223253c0ae62d2defd6f71d2fd4d16071fedd")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-06.lisp")
   :BYTES 24090 :SHA256
   "05b26b12600ec5cd5f6511a577c7865f48f86b95bc7fe6bd3aaa9cb07b189d54")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "6da935820560f497c81925e3ced9792f6f69476b815ffe7eb0eb17a67f35bcba")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-07.lisp.gz")
   :BYTES 410638 :SHA256
   "9fded0116a9731d4c502ff67b8342e54f46c47676c9791ea42f70d5c99933b89")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "bf1d34b4c78f42ce267ac9cc8c089678575f498a39a453b795108e9a26b8625c")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "f87f45b2494c0d8e640186d485994031947a7816dea034bcbc68e87bee87d0f5")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/SPK-10.lisp")
   :BYTES 22976 :SHA256
   "dbf031f77f220498b51a4adcb8d1b2b9277e3004da91011bc446b6941e021926")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "3878381ad017363f8d13f91dc21e34d84b45676b362b48189700aa82846deb7f")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/report.lisp")
   :BYTES 318 :SHA256
   "5308570a521ebe8c014d1fbadde6f03c6639e8057d897dbde07068ea1e7dd36f")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986301-check-78781-0/report.lisp.gz")
   :BYTES 466735 :SHA256
   "1fa180f605ef71a1c10db65c33b238aad379ca0d2d568aff49d41a84a25fcf36")
  (:PATH "raw/mutations/0/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/0/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/src/codec/cbor-map-input.lisp")
   :BYTES 7957 :SHA256
   "628506f493367fc6ee7f22f65517a87d39c1412860865290d5f13fcb097a6807")
  (:PATH "raw/mutations/0/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/test.log")
   :BYTES 31791 :SHA256
   "8fe328d569c25d1215e160a1edd9a286bb1429f7f136824ed193f8184df09415")
  (:PATH "raw/mutations/0/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/0/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/0/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/0/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/0/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/0/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "31ed295b757db240c9ff19dabb61416fa6ff3a55f7f2ad0cc3faf1ed24578c2f")
  (:PATH "raw/mutations/1/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/1/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/1/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "6c4250b59d869f9b4b80584fe9edfccf8dcbe375e084110cf9b4ca08198ec7f9")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/test.log")
   :BYTES 31287 :SHA256
   "af4712b95d80d347d155d41a5ebfa45888848b35f8a83b3223482ed1efcb1e6e")
  (:PATH "raw/mutations/1/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/1/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/1/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/1/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/1/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/1/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "fea623a674af27a3a4aa22446334b0c04e2ef8cf69f9023c1a6b5cb5b3e0be88")
  (:PATH "raw/mutations/2/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/2/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/2/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/src/codec/cbor-map-write.lisp")
   :BYTES 6730 :SHA256
   "3b6bf1643edab3661b836cdca8b39c3f38ba1e6902a5108b91211937407f25e6")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/test.log")
   :BYTES 31168 :SHA256
   "bd789076fd8fafd33db7a9801b445cab16fe9461cc96edf99c26e0a41a8f18d7")
  (:PATH "raw/mutations/2/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/2/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/2/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/2/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/2/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/2/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "fb45ce87ac925e27db75e04e385b7b9cf6b19740749dda33c427ca9206d4cc5e")
  (:PATH "raw/mutations/3/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/3/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/3/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/src/codec/cbor-map-write.lisp")
   :BYTES 6680 :SHA256
   "11cc76a96d27ae0a5a21ccdb3d6d2097e097c0c094117c86ccaeaf69b69b25cc")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/test.log")
   :BYTES 31297 :SHA256
   "c3ed7e5f0143bc77d29ba16841369c65fbee7de00aab9aeed90ae5fc2678286c")
  (:PATH "raw/mutations/3/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/3/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/3/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/3/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/3/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/3/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "f46c6552f71094cfcf88628b36eeafdc8984f6ba24db50d8724165e88e5092b9")
  (:PATH "raw/mutations/4/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/4/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/src/codec/cbor-map-input.lisp")
   :BYTES 7961 :SHA256
   "8a08551bb594a7f0e154dd7685301efb34f3a49e170bac62c502e5ab44167100")
  (:PATH "raw/mutations/4/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/test.log")
   :BYTES 32804 :SHA256
   "42b4dd06be720dd0ff84f6eb8b1145e23fdd5246b12855deb33c7a7d7d55b77c")
  (:PATH "raw/mutations/4/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/4/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/4/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/4/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/4/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/4/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "52a15b1b93de8d218e43a79dc72b41dacb3161b0a4e33d74a90156c87e659f16")
  (:PATH "raw/mutations/5/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/5/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/src/codec/cbor-map-input.lisp")
   :BYTES 7956 :SHA256
   "a75577e83a64f799823457ad6a407ea3a10b89d9dbd3cab969c34cb5c866a962")
  (:PATH "raw/mutations/5/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/test.log")
   :BYTES 32247 :SHA256
   "cb58c6613dbf8dcc99af724891444f84c11e234a756720118634927cf29c11c4")
  (:PATH "raw/mutations/5/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/5/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/5/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/5/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/5/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/5/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "bd3083199b0ce99749c39e740189edc07247942319c97e6225086fe501d00696")
  (:PATH "raw/mutations/6/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/6/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/6/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "1a78897274e474d01b7b72ce15206301b5426f1dad99d21de0486180d0da002a")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/test.log")
   :BYTES 32181 :SHA256
   "bf16b314c9dc5ffe78f1e4e2f48d53234d4d508d2879558edcf485d199390754")
  (:PATH "raw/mutations/6/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/6/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/6/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/6/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/6/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/6/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "e1a20f9cbc05eb93ae9cf2a79c3c0e9d95ce48f5ff3b4cfd592d61b7aa649abc")
  (:PATH "raw/mutations/7/arcdocdb.asd" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/7/src/codec/cbor-map-input.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/7/src/codec/cbor-map-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/src/codec/cbor-map-write.lisp")
   :BYTES 6743 :SHA256
   "9703fd5a30f4d802bae246e76e5bcba514da92c92e97038a12808b5fcb7eed77")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/test.log")
   :BYTES 31188 :SHA256
   "ec1a2df5483654e7a43499bdf4a11f59f601a7b3ce2df4db2f5a797ed0dd2df5")
  (:PATH "raw/mutations/7/tests/codec/cbor-map-write-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/7/tests/codec/cbor-map-write-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/7/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/7/tools/build.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/7/tools/cbor-map-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/7/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 470 :SHA256
   "3df3fa2ca707de5f7fde2c199d104c2b1aec446548fe6bd2cb2ddcacb3e2898a")
  (:PATH "raw/mutations/baseline/arcdocdb.asd" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/arcdocdb.asd")
   :BYTES 16028 :SHA256
   "5840dd92cdc56c8da8d0ccf74dfb8b5208891fdc9d5030600094873afc00fceb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-map-input.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations/baseline/src/codec/cbor-map-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/test.log")
   :BYTES 91589 :SHA256
   "fb632ff2ed0ae0fa38c143bde1e5f59b29bc8516740cc5995d0c73dc83576c32")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-map-write-support.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8425 :SHA256
   "865ca0ca9fbfcb7f0f0ab53b1038efb052664ad1f42f6370530de0539d353eb7")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-map-write-threads.lisp"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4039 :SHA256
   "7c4fdb0a8927d248bdb0c37b7f00b22407e80f2ece18f315205eec4e8db31f44")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/mutations/baseline/tools/build.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/baseline/tools/cbor-map-write-isolated-build.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/baseline/tools/cbor-map-write-isolated-build.lisp")
   :BYTES 484 :SHA256
   "b1eb87103202317411a68edfd79cf7166f47fe8b643f93fa209ee490929140ca")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/mutations/report.lisp")
   :BYTES 89577 :SHA256
   "ef351ac47b9db191ad526695c30f7b46a716207290aeafd7093811b2852c588c")
  (:PATH "raw/precompile/cbor-map-decisioni-original.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/precompile/cbor-map-decisioni-original.md.txt")
   :BYTES 9177 :SHA256
   "40af0fa5867d554234f1e4824f77e89f60822638fff4bc43993686cd673a6189")
  (:PATH "raw/precompile/cbor-map-decisioni-temporary-correction.md.txt"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/precompile/cbor-map-decisioni-temporary-correction.md.txt")
   :BYTES 9138 :SHA256
   "7875d3a4e557aee3029854754d0d73e1e73a1d223c39c51531ec8460b34ac389")
  (:PATH "raw/precompile/root-document-reading-note.md.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/precompile/root-document-reading-note.md.txt")
   :BYTES 922 :SHA256
   "82d35be12708eb8440ce80d6e83ba6be980d23f3035816a8f13f80055d90a813")
  (:PATH "raw/reader-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/report.lisp")
   :BYTES 1943 :SHA256
   "b97c1619c8b7a272031f25abb6294d983aaffcffa744f1a8f148e07e1117b494")
  (:PATH "raw/reader-self-test/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-reader-self-test-72670-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/results-draft.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/results-draft.md.txt")
   :BYTES 7242 :SHA256
   "54b681c435fee328c94702ea653b3bee79dcf9b5b59bacd8e37399af1df7c2ea")
  (:PATH "raw/review/archive-selection-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/archive-selection-reading.md")
   :BYTES 3310 :SHA256
   "aa5a1ca58e2998d7b6cc9cab48e77679fa0410c20e72f3eaf300f06e22a25a9d")
  (:PATH "raw/review/blind-plan.md.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/blind-plan.md")
   :BYTES 6094 :SHA256
   "3a4d2b1c74199bb6d04d325bcb2829d853f47e12480667595fcf791929489a2b")
  (:PATH "raw/review/collection-date-reading.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/collection-date-reading.md")
   :BYTES 1037 :SHA256
   "96046138bf73446dbaefd857f90227b703a9b4761abb3794c7f73ad902283987")
  (:PATH "raw/review/coverage-reading-2.error.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading-2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/coverage-reading-2.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading-2.lisp")
   :BYTES 14151 :SHA256
   "71d6a36ee106e6fb2176b6e4221814b179903177ff94a53b29e9a56222718fa0")
  (:PATH "raw/review/coverage-reading-2.output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading-2.output.txt")
   :BYTES 25809 :SHA256
   "7f9bc83bee7fbdfd0debb9fe9f23e9f2ee16bc9dfb5b5baf1a43168f345bc060")
  (:PATH "raw/review/coverage-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading.error.txt")
   :BYTES 3426 :SHA256
   "22b7cef6999d16822a1f4aea7e83da21b690ec33ddca62a6f491ef26fe9e935d")
  (:PATH "raw/review/coverage-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading.lisp")
   :BYTES 14150 :SHA256
   "6c8e785feec88482e64f7ab66dc80a0b5c3140a0a7b00c414dfdf2df02dbb633")
  (:PATH "raw/review/coverage-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading.md")
   :BYTES 10455 :SHA256
   "131c80172e91695d1623425cae2f63864d775b068d0d6fa9a90424db6872d0fc")
  (:PATH "raw/review/coverage-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/coverage-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/drivers-precompile-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/drivers-precompile-reading.md")
   :BYTES 4656 :SHA256
   "b803ed6b12e367ff59a076390aa204909ed035f8caa53a25939ac310ad1e84bb")
  (:PATH "raw/review/final-integration-reading-2.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading-2.lisp")
   :BYTES 10932 :SHA256
   "56d6b336c61ecd3cbb823bd8324cbea9293ba83a484c2541ed2361265aa196ad")
  (:PATH "raw/review/final-integration-reading-3.error.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading-3.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/final-integration-reading-3.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading-3.lisp")
   :BYTES 11243 :SHA256
   "5283773095e5e2a16140957857707c8786995d9241f421aac56205ec06bcc491")
  (:PATH "raw/review/final-integration-reading-3.output.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading-3.output.txt")
   :BYTES 2711 :SHA256
   "12234f37dd0b34fd59f5ed64c83cb083757c3066c05ba31d64d1fc2e0b0ecc4a")
  (:PATH "raw/review/final-integration-reading.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading.error.txt")
   :BYTES 20675 :SHA256
   "5e1ab32dd6d430fbed0df2d7b5d8854663783073b39b2071d26a762ae09cbc6e")
  (:PATH "raw/review/final-integration-reading.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading.lisp")
   :BYTES 10945 :SHA256
   "8933d05c05df4857d3fd2e8baaa58183361acecd5db4349b87eafb37d2b81b22")
  (:PATH "raw/review/final-integration-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading.md")
   :BYTES 3774 :SHA256
   "7b2f4f20e396a6757e0823a5226d01aa4e99ff133a17fce68805c8ac6242f709")
  (:PATH "raw/review/final-integration-reading.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/final-integration-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/initial-runtime-reading.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/initial-runtime-reading.lisp")
   :BYTES 9495 :SHA256
   "e5bbf4ce0b42e4b3bfcf84fb67ec1e580de973d416cc0dfbf7a7f4003acd18cb")
  (:PATH "raw/review/initial-runtime-reading.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/initial-runtime-reading.md")
   :BYTES 4899 :SHA256
   "09a0808c3de24970d6278ce4f5e2730ac58b5132f27563df897371c24c412669")
  (:PATH "raw/review/initial-runtime-reading.output.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/initial-runtime-reading.output.txt")
   :BYTES 3538 :SHA256
   "41974a38b5b03109cc1274204c2dfff84ba32100bdd3b69c7d29cdab52c7b87e")
  (:PATH "raw/review/integrated-runtime-reading.diagnostics.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.diagnostics.lisp")
   :BYTES 707 :SHA256
   "f0c3ad5a2ca4f654b62e9576df633fa8305fb7c96440b7cc43ca25e562d04f74")
  (:PATH "raw/review/integrated-runtime-reading.diagnostics.output.txt" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.diagnostics.output.txt")
   :BYTES 1267 :SHA256
   "bc39e7d340ae70b05882e956b41a0ce907e06cd6f6470238cc03d732c6f3dc27")
  (:PATH "raw/review/integrated-runtime-reading.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.lisp")
   :BYTES 19251 :SHA256
   "f1e5f3712bdbbce6fbbabfb83048dbf7c1dec1ddbaaf981ca86986628e574d4e")
  (:PATH "raw/review/integrated-runtime-reading.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.md")
   :BYTES 6188 :SHA256
   "8e8d66f1dc09038156be834546c68a998606fbf8aad0f48fe07bad05ca586790")
  (:PATH "raw/review/integrated-runtime-reading.output-2.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.output-2.txt")
   :BYTES 26904 :SHA256
   "67800028a01dc257cd52285663927de70c00e857af1b5670a476a3f4367e98b9")
  (:PATH "raw/review/integrated-runtime-reading.output-3.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.output-3.txt")
   :BYTES 7414 :SHA256
   "b15a8e7a2501abc772e74706ff2722c49080a4c113e1eeecf78bb4f1efa648bf")
  (:PATH "raw/review/integrated-runtime-reading.output.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.output.txt")
   :BYTES 25257 :SHA256
   "5871caa50c8e608d1f37d59efc3b20db80ebe57750d51dcea27598aaa1fc845e")
  (:PATH "raw/review/integrated-runtime-reading.preliminary-2.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.preliminary-2.lisp")
   :BYTES 19226 :SHA256
   "5c5e467248cf221ed5ccc0a8761def993ba991b24b38da01ce6a15b21289ff2c")
  (:PATH "raw/review/integrated-runtime-reading.preliminary.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.preliminary.lisp")
   :BYTES 17977 :SHA256
   "6ec200454bec8d1852f2f158a0a7c2f3ee6139ead2f3412b2fdeafd5617408f4")
  (:PATH "raw/review/integrated-runtime-reading.preparation-errors.md.txt"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.preparation-errors.md")
   :BYTES 2548 :SHA256
   "4170c082fd10b41d2b288571c88cf8b3565f9fcda2b5377647fd689b297543b2")
  (:PATH "raw/review/manifest-builder-reading.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/manifest-builder-reading.md")
   :BYTES 4706 :SHA256
   "c252aabd3e23462c6a581d4839c1ab65fb6a8d2b0e1e92ec00bb5dd53158df46")
  (:PATH "raw/review/mutation-reading.error.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/mutation-reading.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/mutation-reading.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/mutation-reading.lisp")
   :BYTES 18476 :SHA256
   "a0437a5158f400873d658a42f90e2ed07aa36cb3474a24788af0684e81078dd8")
  (:PATH "raw/review/mutation-reading.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/mutation-reading.md")
   :BYTES 9366 :SHA256
   "a1cc71adb4c4130211f14e9c4ac2787a74c936975d133a06cd750ea9de276ae9")
  (:PATH "raw/review/mutation-reading.output.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/mutation-reading.output.txt")
   :BYTES 16050 :SHA256
   "fe115c6290e5e3ce07cd47a7c63cda62f88fc1f30094dc36c6065bc3cd46559e")
  (:PATH "raw/review/mutator-final-reading.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-map-write-20261014/review/mutator-final-reading.md")
   :BYTES 7386 :SHA256
   "8008a57243596a98e691ce52612a7f8d95deb7fc523a7ed3469bf0b0bc0a35ee")
  (:PATH "raw/snapshot-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test/completion-exit/stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/completion-exit/stdout.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/report.lisp")
   :BYTES 1961 :SHA256
   "0937741a49c7614b1569af74fc6f889637d9cc708c538b887921e299303ebcb1")
  (:PATH "raw/snapshot-self-test/signal/isolated-build.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000986108-snapshot-self-test-72655-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "processes/archive-preparation/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988440-command-29374-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "aefe3e8189ade34ae0d37b645cf9ba5446d85a82965694d296a594f5e81cc4fe")
  (:PATH "processes/archive-preparation/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988440-command-29374-0/report.lisp")
   :BYTES 181347 :SHA256
   "5b4f86f04ab950fa885395daca2ccb1157b8a1d06b41dedec5b56fffd1660109")
  (:PATH "processes/archive-preflight/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988502-command-30982-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "8a04f137534acbb6bca06fe44af6fd229bf22f6a276c195e2446131ce8054e09")
  (:PATH "processes/archive-preflight/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988502-command-30982-0/report.lisp")
   :BYTES 182303 :SHA256
   "b8803ec67d5aea15649de0688e200fa2823887fc7174ded65aaea848da1144b7")
  (:PATH "processes/archive-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988537-command-31095-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "87b663333c3671ac3bb4810f605d5615a3e32ec64069eb994ad1e78aa411d4d4")
  (:PATH "processes/archive-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988537-command-31095-0/report.lisp")
   :BYTES 181183 :SHA256
   "c77e4c5507e88d204cdf6e3ab36674512328c2a6046fc70de18ac6b9ba033b5d")
  (:PATH "processes/archive-data-reading/closed-check-original.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/closed-check-original.log")
   :BYTES 5062 :SHA256
   "eb4eebea99145d9790c3a4dda63a8ad105b3913c9809ae59b9d0da38642f971a")
  (:PATH "processes/archive-data-reading/collection-observation-original.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/collection-observation-original.lisp")
   :BYTES 112626 :SHA256
   "84817cffc5bca2059eabe036f0ffd7a4328bbb037f7b0ae664ecd1922cf4ebdf")
  (:PATH "processes/archive-data-reading/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "573c45d647deffda63429949eea5a250d3c7700c10a0853924370c778107767d")
  (:PATH "processes/archive-data-reading/preserve-originals-tool.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/preserve-originals-tool.lisp")
   :BYTES 2120 :SHA256
   "a63aae561ead1cf2dd23570050176b156976f5e9b03812fab82d5509aacabc3b")
  (:PATH "processes/archive-data-reading/preserved-collection-originals.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/preserved-collection-originals.lisp")
   :BYTES 1610 :SHA256
   "f448c571197220ff84932aa01dd30c6a13e8e48cd33456f597319da02064b44f")
  (:PATH "processes/archive-data-reading/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988658-command-33807-0/report.lisp")
   :BYTES 303148 :SHA256
   "3422db4e504ebf31d5efe79626143fc2161c092e5bbcb1c1b1338cce94e98aae")
  (:PATH "processes/archive-original-preservation/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988683-command-34350-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f8d4b8108c274a12ee768a3213168bc784fe3a488244f59663359c59965dd882")
  (:PATH "processes/archive-original-preservation/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000988683-command-34350-0/report.lisp")
   :BYTES 182853 :SHA256
   "4e5f19bf06774e6193cee55c143d681020a848e1ef0c59f463d4229f4b49793b"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
