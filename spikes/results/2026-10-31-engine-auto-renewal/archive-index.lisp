(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "strict-existing-cases" :RECORD-PATH "strict-existing-cases.lisp"
   :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/m1-auto-renewal/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-attempt-01-syntax" :RECORD-PATH
   "targeted-attempt-01-syntax.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/m1-auto-renewal/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "syntax-balance-diagnostic" :RECORD-PATH
   "syntax-balance-diagnostic.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "spikes/out/m1-auto-renewal/balance.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-attempt-02-oracle" :RECORD-PATH
   "targeted-attempt-02-oracle.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/m1-auto-renewal/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-pre-review-2.6.9" :RECORD-PATH
   "targeted-pre-review-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/m1-auto-renewal/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-pre-review-2.6.9" :RECORD-PATH
   "allocation-pre-review-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/m1-auto-renewal/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-final-2.6.9" :RECORD-PATH "allocation-final-2.6.9.lisp"
   :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/m1-auto-renewal/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-final-2.6.10" :RECORD-PATH "targeted-final-2.6.10.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/m1-auto-renewal/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-final-2.6.10" :RECORD-PATH "allocation-final-2.6.10.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/m1-auto-renewal/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-final-2.6.9" :RECORD-PATH "full-final-2.6.9.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-final-2.6.9" :RECORD-PATH "ci-final-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((13) BASE-CHAR . "tools/ci.lisp") #A((9) BASE-CHAR . "self-test")
    #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793435099-37561"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "allocation-final-2.6.10.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-final-2.6.10.lisp")
   :BYTES 334 :SHA256
   "7c23fe083a28ee5be88d5102962482e2eba3f8d1e0f7c672dad15656e3280ee7")
  (:PATH "allocation-final-2.6.10.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-final-2.6.10.lisp.gz")
   :BYTES 100070 :SHA256
   "af5ba84419e481ba407dbca1c60ffd93b3d2213b07a234e146ad72ea73fa9690")
  (:PATH "allocation-final-2.6.9.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-final-2.6.9.lisp")
   :BYTES 333 :SHA256
   "cb455ae1940dbba203fe5d22782977250afc28129be5d6a9719dd61ca2cbf70f")
  (:PATH "allocation-final-2.6.9.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-final-2.6.9.lisp.gz")
   :BYTES 100097 :SHA256
   "c669cb9ed1a9cdd20fdaf362899a7926367ce7aaaa18c70c58cf73a56180873c")
  (:PATH "allocation-pre-review-2.6.9.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-pre-review-2.6.9.lisp")
   :BYTES 338 :SHA256
   "887ccce4da481ddd6a8e8ce131c569e22e8fc36f00ed053d64ac6e226f6d61fa")
  (:PATH "allocation-pre-review-2.6.9.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/allocation-pre-review-2.6.9.lisp.gz")
   :BYTES 100109 :SHA256
   "9583f8ad537438313b8947c44b6fc49d8229ac06a91ae160c4266c3cc6b2b360")
  (:PATH "allocation.lisp" :SOURCE
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/allocation.lisp")
   :BYTES 2280 :SHA256
   "fac834b09260d857c19866320cc2cbc139100f9b6ddc9cfc64a9c28bdc1a40e8")
  (:PATH "ci-final-2.6.9.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/ci-final-2.6.9.lisp")
   :BYTES 324 :SHA256
   "7f00ac3cfae2d5245d3002053d611040ef384ad8cc7326d07d14c35430b88a0f")
  (:PATH "ci-final-2.6.9.lisp.gz" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/ci-final-2.6.9.lisp.gz")
   :BYTES 100063 :SHA256
   "96a278cf62fd3470a2329e6769706fc01c28fcd20a9df713275cc3e1b6073248")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/collection-input.lisp")
   :BYTES 8322 :SHA256
   "bf98a0e22d0a2903938eb7fcf8e4bf9650bb229a538690781a99d2d3c6437638")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "diagnostics/balance.lisp.txt" :SOURCE
   #A((79) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/balance.lisp")
   :BYTES 879 :SHA256
   "16a6dfaa9e3e2baa5bc713d9f28d245281e32e7f8f70aa6505acb8eedc3d38da")
  (:PATH "full-final-2.6.9.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/full-final-2.6.9.lisp")
   :BYTES 327 :SHA256
   "72c55016f14dc901a5627f749feb206ebf12b9e0abbd1ceccc2c2a3aa5a0a6be")
  (:PATH "full-final-2.6.9.lisp.gz" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/full-final-2.6.9.lisp.gz")
   :BYTES 324621 :SHA256
   "8e04dff73a00005fdd54c6d3ca2a4e9068341c9bd3dfa71c54aefec91fbdc9d1")
  (:PATH "report.md" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/report.md.txt")
   :BYTES 7320 :SHA256
   "0037473da337971ae86337adba283446b2f20b1634cc7ae67352d40ded82752a")
  (:PATH "snapshots/activation-pre-review.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/activation-pre-review.lisp.txt")
   :BYTES 6962 :SHA256
   "5872e5ec6851f5c4314699657fb946d5e6d2a2488757ca82fe32918c79342648")
  (:PATH "snapshots/asd-before-new-tests.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/asd-before-new-tests.lisp.txt")
   :BYTES 29163 :SHA256
   "f490b6b31bf79198040fe7d3e5bf4e1e99c89a8652dd6fa4e01b81b6d2dbd238")
  (:PATH "snapshots/auto-write-pre-review.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/auto-write-pre-review.lisp.txt")
   :BYTES 4513 :SHA256
   "f0e3dab3c6baff3d3c9dd0fb23cf53bacfd98ebe6fb474c884ce044e2f310882")
  (:PATH "snapshots/lifecycle-pre-review.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/lifecycle-pre-review.lisp.txt")
   :BYTES 6177 :SHA256
   "eb9985bf51f3c88aa80461b5748d7ccc4434593aa341a3209d7dab6db7f42982")
  (:PATH "snapshots/package-pre-review.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/package-pre-review.lisp.txt")
   :BYTES 1949 :SHA256
   "11a01722bfab0e33d06a556d2505dfc8b3a0241317cbb4fc635ef9cf5d47cd61")
  (:PATH "snapshots/processes-before-new-tests.lisp.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/processes-before-new-tests.lisp.txt")
   :BYTES 6237 :SHA256
   "ba9f72a0b97acb71774e6b35b7384b4797336c6feac4157812b2ae5dee2b154b")
  (:PATH "snapshots/source-identities.lisp" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/source-identities.lisp")
   :BYTES 1976 :SHA256
   "2c3f7dd1da929a2d8221d0eddc004357efe9e09ee49b8aaebcf31e3b6dda78fc")
  (:PATH "snapshots/tests-attempt-01.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/tests-attempt-01.lisp.txt")
   :BYTES 18063 :SHA256
   "fcd5a3c25345d4706444de2cb58b71f6dc32b570023ab52fff8ef2bd6ccfa595")
  (:PATH "snapshots/tests-attempt-02.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/tests-attempt-02.lisp.txt")
   :BYTES 18061 :SHA256
   "bc33e25b35639330ac705e00008fe8bf1ff6551c8c4d3750025112ffb3c9720c")
  (:PATH "snapshots/tests-attempt-03.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/tests-attempt-03.lisp.txt")
   :BYTES 22563 :SHA256
   "71531bf22c3e14abf9e77b56fa076724f782b30fbfe8e27608a415c4b4206f00")
  (:PATH "snapshots/types-pre-review.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/types-pre-review.lisp.txt")
   :BYTES 3673 :SHA256
   "ee3f08d747eac5cb0fa50bd81c6b76e306d3bbfbc45e5440a8f7259d16cadb28")
  (:PATH "snapshots/write-pre-review.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/snapshots/write-pre-review.lisp.txt")
   :BYTES 8559 :SHA256
   "af0fbfd30b2469298269808c1ebc5b2e6ef72d64b8e687a24d6062f1fba3a060")
  (:PATH "strict-existing-cases.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/strict-existing-cases.lisp")
   :BYTES 332 :SHA256
   "11970dcdc5aae86e3ccf80141a0455cc437ae5bcc778ea0b9d2a18225bfc3ce5")
  (:PATH "strict-existing-cases.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/strict-existing-cases.lisp.gz")
   :BYTES 100849 :SHA256
   "1afef1a14dbfa36cdd2c599413a81c7b8f3fa8226340520f615fdc805089af0c")
  (:PATH "syntax-balance-diagnostic.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/syntax-balance-diagnostic.lisp")
   :BYTES 336 :SHA256
   "76d278ce3630efce94d6856cb3ceb57a1f768958cec4889c9f8a2c8e18d05c2a")
  (:PATH "syntax-balance-diagnostic.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/syntax-balance-diagnostic.lisp.gz")
   :BYTES 100688 :SHA256
   "3a8971b5cdb47c455b7484afc07d587a17d2c48f58b1049a80f092f09008b8c8")
  (:PATH "targeted-attempt-01-syntax.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-attempt-01-syntax.lisp")
   :BYTES 337 :SHA256
   "8df8df0cafabfb7725d50b6e46850e73a7ce2113476a33952091eb0aad51196c")
  (:PATH "targeted-attempt-01-syntax.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-attempt-01-syntax.lisp.gz")
   :BYTES 102024 :SHA256
   "c84549bb770733ef72f84213f59ecfd23df58d28a11d8de426c6235936127a8e")
  (:PATH "targeted-attempt-02-oracle.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-attempt-02-oracle.lisp")
   :BYTES 337 :SHA256
   "1085eb0407c66c01300aae5e5cd2430f2c1c364ed00d08570adb13fcdd870438")
  (:PATH "targeted-attempt-02-oracle.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-attempt-02-oracle.lisp.gz")
   :BYTES 102757 :SHA256
   "d0c84f32e0739dff4c825a8934b486185fdfbb69d20b2366e18f0d5d30096242")
  (:PATH "targeted-final-2.6.10.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-final-2.6.10.lisp")
   :BYTES 332 :SHA256
   "ad6590497bc09e9f4eeef49bd7df0f4370ad440f256442c0ada6b1fd3e32c833")
  (:PATH "targeted-final-2.6.10.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-final-2.6.10.lisp.gz")
   :BYTES 101426 :SHA256
   "6d1b8b8cd59115b3f120b585760031225da3256a962b2e8dd03a49e74354c989")
  (:PATH "targeted-pre-review-2.6.9.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-pre-review-2.6.9.lisp")
   :BYTES 336 :SHA256
   "19876238e58d9267f29f5ae725ad1bcdcf71eb208a4cf43da38cec70b53b38d4")
  (:PATH "targeted-pre-review-2.6.9.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/archive-input/targeted-pre-review-2.6.9.lisp.gz")
   :BYTES 101453 :SHA256
   "78e2d024b04e9e85dda69c68edc8b543af51e1215e98138de51b0e4a74fadf3a")
  (:PATH "targeted.lisp" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-auto-renewal/targeted.lisp")
   :BYTES 944 :SHA256
   "12cecf4298991003cea66433b1507e3ab4b51765de6c8858a32f4e701a6fb7e2"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
