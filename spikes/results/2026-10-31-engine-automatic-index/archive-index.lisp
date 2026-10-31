(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((30) BASE-CHAR . "allocation-before-quota-2.6.10") :RECORD-PATH
   "allocation-before-quota-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/auto-completion/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((29) BASE-CHAR . "allocation-before-quota-2.6.9") :RECORD-PATH
   "allocation-before-quota-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/auto-completion/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((23) BASE-CHAR . "allocation-final-2.6.10") :RECORD-PATH
   "allocation-final-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/auto-completion/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((22) BASE-CHAR . "allocation-final-2.6.9") :RECORD-PATH
   "allocation-final-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/auto-completion/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((28) BASE-CHAR . "argument-guards-before-quota") :RECORD-PATH
   "argument-guards-before-quota.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((47) BASE-CHAR . "spikes/out/auto-completion/argument-guards.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((22) BASE-CHAR . "attempt-01-test-syntax") :RECORD-PATH
   "attempt-01-test-syntax.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((22) BASE-CHAR . "attempt-02-test-syntax") :RECORD-PATH
   "attempt-02-test-syntax.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "ci-final-2.6.9") :RECORD-PATH
   "ci-final-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((13) BASE-CHAR . "tools/ci.lisp") #A((9) BASE-CHAR . "self-test")
    #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793442086-80850"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "disk-core-smoke") :RECORD-PATH
   "disk-core-smoke.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/auto-completion/disk-smoke.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "engine-smoke") :RECORD-PATH "engine-smoke.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((44) BASE-CHAR . "spikes/out/auto-completion/engine-smoke.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((36) BASE-CHAR . "full-before-local-fixture-adaptation")
   :RECORD-PATH "full-before-local-fixture-adaptation.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "full-final-2.6.9") :RECORD-PATH
   "full-final-2.6.9.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((23) BASE-CHAR . "full-pre-review-stopped") :RECORD-PATH
   "full-pre-review-stopped.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((29) BASE-CHAR . "heap-before-retirement-review") :RECORD-PATH
   "heap-before-retirement-review.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "spikes/out/auto-completion/heap-driver.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "heap-final") :RECORD-PATH "heap-final.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "spikes/out/auto-completion/heap-driver.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "heap-initial") :RECORD-PATH "heap-initial.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "spikes/out/auto-completion/heap-driver.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((18) BASE-CHAR . "initial-mode-tests") :RECORD-PATH
   "initial-mode-tests.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((21) BASE-CHAR . "local-fixture-adapted") :RECORD-PATH
   "local-fixture-adapted.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/auto-completion/local-targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((31) BASE-CHAR . "local-fixture-syntax-attempt-01") :RECORD-PATH
   "local-fixture-syntax-attempt-01.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/auto-completion/local-targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((31) BASE-CHAR . "local-fixture-syntax-attempt-02") :RECORD-PATH
   "local-fixture-syntax-attempt-02.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/auto-completion/local-targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((19) BASE-CHAR . "mode-and-disk-tests") :RECORD-PATH
   "mode-and-disk-tests.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((31) BASE-CHAR . "mode-tests-before-native-review") :RECORD-PATH
   "mode-tests-before-native-review.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((25) BASE-CHAR . "qualified-targeted-2.6.10") :RECORD-PATH
   "qualified-targeted-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((25) BASE-CHAR . "quota-defect-reproduction") :RECORD-PATH
   "quota-defect-reproduction.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/auto-completion/quota-regression.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "quota-regression") :RECORD-PATH
   "quota-regression.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/auto-completion/quota-regression.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((30) BASE-CHAR . "retirement-defect-reproduction") :RECORD-PATH
   "retirement-defect-reproduction.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/auto-completion/retirement-diagnostic.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((21) BASE-CHAR . "retirement-regression") :RECORD-PATH
   "retirement-regression.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((53) BASE-CHAR
       . "spikes/out/auto-completion/retirement-regression.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((37) BASE-CHAR . "supplemental-before-retirement-review")
   :RECORD-PATH "supplemental-before-retirement-review.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((44) BASE-CHAR . "spikes/out/auto-completion/supplemental.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((33) BASE-CHAR . "targeted-before-retirement-review") :RECORD-PATH
   "targeted-before-retirement-review.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((21) BASE-CHAR . "targeted-final-2.6.10") :RECORD-PATH
   "targeted-final-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((40) BASE-CHAR . "spikes/out/auto-completion/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "allocation-before-quota-2.6.10.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-before-quota-2.6.10.lisp")
   :BYTES 341 :SHA256
   "9d814102e7e15159cc1c7f03e63e0751473d15594658f4931cb3666914bac754")
  (:PATH "allocation-before-quota-2.6.10.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-before-quota-2.6.10.lisp.gz")
   :BYTES 101682 :SHA256
   "ec8c25a85399a32e4e79538bb4e7eadb1af16a68c9ca27ffbe1367fb1989abfc")
  (:PATH "allocation-before-quota-2.6.9.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-before-quota-2.6.9.lisp")
   :BYTES 340 :SHA256
   "71f9bd302d9798bd6eaec1f8de194799661f002ffabfbaab62877bea36442a22")
  (:PATH "allocation-before-quota-2.6.9.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-before-quota-2.6.9.lisp.gz")
   :BYTES 101708 :SHA256
   "b96da478e55e449d375bb8dddb628610bbae834a77aa767d8be90ca428dfb908")
  (:PATH "allocation-final-2.6.10.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-final-2.6.10.lisp")
   :BYTES 334 :SHA256
   "ba5c905cd46823761568d5f529515b7b0438ca39c1bc543b9d976cf5f6c9d028")
  (:PATH "allocation-final-2.6.10.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-final-2.6.10.lisp.gz")
   :BYTES 101678 :SHA256
   "941ef9928a85644620478a8342c9d8ce37ae916183f5ba29531efb564b245fb4")
  (:PATH "allocation-final-2.6.9.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-final-2.6.9.lisp")
   :BYTES 333 :SHA256
   "dd535ca455441c74705bb6bc79bd9b3a78e4b27b3f3a82a42908968431a6d16a")
  (:PATH "allocation-final-2.6.9.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/allocation-final-2.6.9.lisp.gz")
   :BYTES 101709 :SHA256
   "fdaf1278927dbc1b3416d5718a1babf908af5ea215db99fdb27ec974d259b299")
  (:PATH "argument-guards-before-quota.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/argument-guards-before-quota.lisp")
   :BYTES 339 :SHA256
   "214a12a049efcdb59e6aff4fb725c40141370cc647f63e70e16be274bfe43996")
  (:PATH "argument-guards-before-quota.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/argument-guards-before-quota.lisp.gz")
   :BYTES 101567 :SHA256
   "36a5c845785a5f00b1c95e39970ba761b73405bd31584a533d91f539cde0f873")
  (:PATH "attempt-01-test-syntax.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/attempt-01-test-syntax.lisp")
   :BYTES 333 :SHA256
   "6b92bd4bf71e15657d0ed14dd32b506dc6398bf04a28e858372289215b6375f9")
  (:PATH "attempt-01-test-syntax.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/attempt-01-test-syntax.lisp.gz")
   :BYTES 103515 :SHA256
   "ec0fd3c8e74e5967bf2ea3307c3db999a3cd7f0b452f4933be5149645788af2c")
  (:PATH "attempt-02-test-syntax.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/attempt-02-test-syntax.lisp")
   :BYTES 333 :SHA256
   "7000538556c51ce6ee978a888d9f39d249d7ef64eba38e44cc1c226c378457c3")
  (:PATH "attempt-02-test-syntax.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/attempt-02-test-syntax.lisp.gz")
   :BYTES 103625 :SHA256
   "2da932d132fe5539c996afa21868ecba86972f0fa5a6899ffacace6d211effc4")
  (:PATH "ci-final-2.6.9.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/ci-final-2.6.9.lisp")
   :BYTES 324 :SHA256
   "838f9f685ff78797d17df6a3d268d947f7bf2708343b54d408566548de7d3c32")
  (:PATH "ci-final-2.6.9.lisp.gz" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/ci-final-2.6.9.lisp.gz")
   :BYTES 101805 :SHA256
   "2e7dece074bb808c6bc869bf175dc64d370f0357bcbd8a83cd486ad42d991ed7")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/collection-input.lisp")
   :BYTES 36729 :SHA256
   "68d9dd3bab8d1c9485bf56f173233b314b3922eb8471b18801418c1996fa9a3b")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "diagnostics/collection-attempt-01.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/diagnostics/collection-attempt-01.lisp.txt")
   :BYTES 178 :SHA256
   "c519983fa9effa281ad3663aa074f49bbd074372a1f806b8849d853ef817185e")
  (:PATH "diagnostics/compile.log.gz" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/diagnostics/compile.log.gz")
   :BYTES 52573 :SHA256
   "7c53d8d5e8e8d0c97536521b3686754d6f466be4ee749370bb0feec9abfe7285")
  (:PATH "diagnostics/layout-compile.log.gz" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/diagnostics/layout-compile.log.gz")
   :BYTES 1977 :SHA256
   "5bc02117959bfa9051bae1759bb1877d9fb736fe3c59fe87323f2a86b59bcfe9")
  (:PATH "disk-core-smoke.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/disk-core-smoke.lisp")
   :BYTES 325 :SHA256
   "91c853e19fad39591d2c81dcb04453d81b6b3c8027ed7ebd96f2e8f75661c8c3")
  (:PATH "disk-core-smoke.lisp.gz" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/disk-core-smoke.lisp.gz")
   :BYTES 100818 :SHA256
   "90ebf64c04d8b2d347d7c452ceac849d44b29a8ee239e3d8da87d2cf0acc4309")
  (:PATH "drivers/allocation.lisp" :SOURCE
   #A((82) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/allocation.lisp")
   :BYTES 3160 :SHA256
   "570b67236537fc2765f1545d59a09369b7629dfd7a8f50983d073f6185c820b7")
  (:PATH "drivers/argument-guards.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/argument-guards.lisp")
   :BYTES 1238 :SHA256
   "e5412b0d7462dfc39f6eb5744dd12b30996317bdaff3d0a85c2ef72067a85b52")
  (:PATH "drivers/heap-driver.lisp" :SOURCE
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/heap-driver.lisp")
   :BYTES 885 :SHA256
   "bf10ae16cbab442cd5b617931d089efa80287930bbd93b3fca4a669b4610fcb2")
  (:PATH "drivers/heap-worker.lisp" :SOURCE
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/heap-worker.lisp")
   :BYTES 2543 :SHA256
   "4e180533ba0a7620f94ab320440de1eca8a7d7c1d22ea4522d98ef4f70a6574a")
  (:PATH "drivers/local-targeted.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/local-targeted.lisp")
   :BYTES 329 :SHA256
   "0e74fe9ae53615fa6c925de6120cc06f05922e2a809d105fd72709eb4d92bf20")
  (:PATH "drivers/quota-regression.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/quota-regression.lisp")
   :BYTES 510 :SHA256
   "77174ffeebd3246a52309d472292724757c7774e24e1398a1f03786506ccff49")
  (:PATH "drivers/retirement-diagnostic.lisp" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/retirement-diagnostic.lisp")
   :BYTES 1563 :SHA256
   "04bc12f84de185d2b170fb4ca6752e3d762217368adb563e57d9385338309684")
  (:PATH "drivers/retirement-regression.lisp" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/retirement-regression.lisp")
   :BYTES 515 :SHA256
   "567d845096b2d43f1b348d800fb362d1f49a2cc0e17d1dc4822cd4709dd29e1a")
  (:PATH "drivers/supplemental.lisp" :SOURCE
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/supplemental.lisp")
   :BYTES 2524 :SHA256
   "ec445bbacea2c388114d5d1a085b2df33943390ffb43a18d22cc463b3fa31c63")
  (:PATH "drivers/targeted.lisp" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/targeted.lisp")
   :BYTES 756 :SHA256
   "509ab72b23fda347c124655ba6340566133216a74fe646688969249886d9274a")
  (:PATH "engine-smoke.lisp" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/engine-smoke.lisp")
   :BYTES 322 :SHA256
   "34bcf266541012d9787564894bd7a9eea0d5356dc89cc5c306aeb59c986f4661")
  (:PATH "engine-smoke.lisp.gz" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/engine-smoke.lisp.gz")
   :BYTES 101465 :SHA256
   "120e23c38d04b5f982268b36ea384869013bed7b492313b0e3927883b145e09c")
  (:PATH "final-working-tree.patch" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/final-working-tree.patch")
   :BYTES 97941 :SHA256
   "6f03cfb270ce45103fd527d4698d436d6e4ac8afeadd3675f2f3787abe29e9ef")
  (:PATH "full-before-local-fixture-adaptation.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-before-local-fixture-adaptation.lisp")
   :BYTES 348 :SHA256
   "b2ef1fc145901001f1b2affdb44efdd132ff7567eccad02f8f559e9c122896ac")
  (:PATH "full-before-local-fixture-adaptation.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-before-local-fixture-adaptation.lisp.gz")
   :BYTES 321544 :SHA256
   "c1e1357b5240a9bbbbaed95aa814057f76e301d693b4c5751095a6ed21718437")
  (:PATH "full-final-2.6.9.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-final-2.6.9.lisp")
   :BYTES 327 :SHA256
   "1f5b5c2cbf17c413ef0a98ffb1ba8390a078aca04e62efe9607e03247ec6afe3")
  (:PATH "full-final-2.6.9.lisp.gz" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-final-2.6.9.lisp.gz")
   :BYTES 334920 :SHA256
   "91c362b3c137e2477e86da91d563581db85cbd0d70d33f7aad00c7f768fcbeb5")
  (:PATH "full-pre-review-stopped.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-pre-review-stopped.lisp")
   :BYTES 335 :SHA256
   "565771412e5bb8008df20e294d347d57e98505737a6441c7a7fb87a795e35e03")
  (:PATH "full-pre-review-stopped.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/full-pre-review-stopped.lisp.gz")
   :BYTES 318208 :SHA256
   "9dbfe4fed47142c30f565537c3066705013010e569143c6d587fe07b96bde8d7")
  (:PATH "heap-before-retirement-review.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-before-retirement-review.lisp")
   :BYTES 340 :SHA256
   "351bdbafd0a602f5cee091846edd3cd0db455483689657683ef6d6fdcb3acf18")
  (:PATH "heap-before-retirement-review.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-before-retirement-review.lisp.gz")
   :BYTES 102255 :SHA256
   "8c3aeee565e4003c56cd46cb3b1d571e54f79404f35c9115c7011ce5ee1ec02c")
  (:PATH "heap-final.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-final.lisp")
   :BYTES 320 :SHA256
   "68f8c1f2b13fda16376f1921904afdebca073a20257b4cac49069a53015b72ea")
  (:PATH "heap-final.lisp.gz" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-final.lisp.gz")
   :BYTES 102262 :SHA256
   "b5318ff791a3382c55ad390173fcf4d253e544bf12c7228a003015ba5fd136d0")
  (:PATH "heap-initial.lisp" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-initial.lisp")
   :BYTES 322 :SHA256
   "dcd4f4e3e2f191c1f0d4315f706359172989e4c2af75d30b0dda11e54cddeda1")
  (:PATH "heap-initial.lisp.gz" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/heap-initial.lisp.gz")
   :BYTES 101891 :SHA256
   "10801e8b3656364590751a165717f54f352803d047b42123719b19257c0f6418")
  (:PATH "initial-mode-tests.lisp" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/initial-mode-tests.lisp")
   :BYTES 328 :SHA256
   "4ce337ba9ac82344acade853ebe526edc8b41315f916ad4c809a0e2cc4332083")
  (:PATH "initial-mode-tests.lisp.gz" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/initial-mode-tests.lisp.gz")
   :BYTES 102488 :SHA256
   "bf59425d7823c332f00cb8a1fb7634df44fcae781e606febb97be8d0aaa62820")
  (:PATH "local-fixture-adapted.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-adapted.lisp")
   :BYTES 332 :SHA256
   "58d8f7de35ad8d7c71d7daf3ffd7eb2183f3a6b1a3fbf28d715fe5b462104687")
  (:PATH "local-fixture-adapted.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-adapted.lisp.gz")
   :BYTES 101823 :SHA256
   "c62e7b2ccae5f5814bb55b1a5c2f94bf1cddb73788e780391829f95644023420")
  (:PATH "local-fixture-syntax-attempt-01.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-syntax-attempt-01.lisp")
   :BYTES 342 :SHA256
   "1334f9aa8e3b3308b0d8a1d48db89c596bae43ae220070df6232475242d46c50")
  (:PATH "local-fixture-syntax-attempt-01.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-syntax-attempt-01.lisp.gz")
   :BYTES 103518 :SHA256
   "55226dd3c99f8a074a2741dc6f4224ac88b57f0bcf93685a8fcfc614aaac4597")
  (:PATH "local-fixture-syntax-attempt-02.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-syntax-attempt-02.lisp")
   :BYTES 342 :SHA256
   "4fc5ef5422764a2268ac03b5a172fc31216f18fba1b52fc936dab6ecd4ba41f6")
  (:PATH "local-fixture-syntax-attempt-02.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/local-fixture-syntax-attempt-02.lisp.gz")
   :BYTES 103518 :SHA256
   "d06de9240568408a1aac56d1337947213d53040a6d09c0025ab5017442c54570")
  (:PATH "mode-and-disk-tests.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/mode-and-disk-tests.lisp")
   :BYTES 329 :SHA256
   "0a750787938802cf7bef57e08e9f6e79a4ccd000300b2e9a2da7f5d973454e23")
  (:PATH "mode-and-disk-tests.lisp.gz" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/mode-and-disk-tests.lisp.gz")
   :BYTES 102798 :SHA256
   "aa42e3536dd74ff449b10049180e61d2b1b463d2364afa58843944ae738a9cec")
  (:PATH "mode-tests-before-native-review.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/mode-tests-before-native-review.lisp")
   :BYTES 342 :SHA256
   "de0d448764bc9c272e180b7d7baa015f00808d9bbd53d1d579adb8e279ee604e")
  (:PATH "mode-tests-before-native-review.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/mode-tests-before-native-review.lisp.gz")
   :BYTES 103055 :SHA256
   "feeaf5da3e0a3d3276fa827a4d3cd90cf36151e03ad46a0a1235cb5ecc5ec7ca")
  (:PATH "qualified-targeted-2.6.10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/qualified-targeted-2.6.10.lisp")
   :BYTES 336 :SHA256
   "198c0874496f0342d4be8b9b6a98fa983619ee4295082842a343af1f63b782e7")
  (:PATH "qualified-targeted-2.6.10.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/qualified-targeted-2.6.10.lisp.gz")
   :BYTES 103154 :SHA256
   "8b4b7251a7039ec87baf2af5a6f665672c9068120a36f3d7f462d2ebed4d100f")
  (:PATH "quota-defect-reproduction.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/quota-defect-reproduction.lisp")
   :BYTES 336 :SHA256
   "8cfd7081d9c6e5e14b5d0ee777c24f66825bd0fc6bbc0cc2bcc7b0bb2fe0f9cd")
  (:PATH "quota-defect-reproduction.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/quota-defect-reproduction.lisp.gz")
   :BYTES 102786 :SHA256
   "80835e632fb041c9a1577b19ccc65bcfc88c9090ded712e3c39c74f3839abbbc")
  (:PATH "quota-regression.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/quota-regression.lisp")
   :BYTES 326 :SHA256
   "2c546305d08fd080bed15497a76c3c22cfe8ff26f3bfa035facce8d54eb415fb")
  (:PATH "quota-regression.lisp.gz" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/quota-regression.lisp.gz")
   :BYTES 101573 :SHA256
   "ad4399c89499fae46e3b96bb80fbe66b6b679bb32d8d08d8b48449ca5821e0e7")
  (:PATH "report.md" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/report.md.txt")
   :BYTES 7679 :SHA256
   "7ba36b24f4332b99a3d3f4dd237759f917c3e6151b37b66aec0410f8e32e36bb")
  (:PATH "retirement-defect-reproduction.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/retirement-defect-reproduction.lisp")
   :BYTES 341 :SHA256
   "b48f4a380e2210037975997d0b96e16f8a1faec33a7694a261157ab6bdfd1919")
  (:PATH "retirement-defect-reproduction.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/retirement-defect-reproduction.lisp.gz")
   :BYTES 101579 :SHA256
   "a7d524709b03612aa995d34f61636c5c7a82636229132d8d59e50021c75da4d7")
  (:PATH "retirement-pre-review/src/engine/index-auto-files.lisp.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/retirement-pre-review/src/engine/index-auto-files.lisp.txt")
   :BYTES 6352 :SHA256
   "752c66a6e24df7e8375f86a97008a0265b517388092d2d4cc8eb71aa6a4916ac")
  (:PATH "retirement-pre-review/src/engine/index-auto-migrate.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/retirement-pre-review/src/engine/index-auto-migrate.lisp.txt")
   :BYTES 8522 :SHA256
   "eb0addf3b275e7545ca220f57aecfefb8136e0eae7a10184a8caf16b75b09a47")
  (:PATH "retirement-pre-review/tests/engine/index-automatic.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/retirement-pre-review/tests/engine/index-automatic.lisp.txt")
   :BYTES 13831 :SHA256
   "5e15b4c370243888f49e64c17d846c220731fe93e4a7f397cae0f289b1fac231")
  (:PATH "retirement-regression.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/retirement-regression.lisp")
   :BYTES 332 :SHA256
   "ac45a8e9ccf8b65abcb4f2ab38407b396e4874a8f0b783e067a1c8e8543b6c4e")
  (:PATH "retirement-regression.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/retirement-regression.lisp.gz")
   :BYTES 101573 :SHA256
   "301c82e3b6657e7613fe4df99d7f0e94d986c450a25a0147331fc8197a1892c9")
  (:PATH "review.md" :SOURCE
   #A((80) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/review.md.txt")
   :BYTES 21038 :SHA256
   "8c9e36cb8c28f798de9cdf105a44b497ca758ff73c6b95cde2e21ec9cfac45b6")
  (:PATH "snapshots/local-server-before-auto-fixture.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/local-server-before-auto-fixture.lisp.txt")
   :BYTES 8662 :SHA256
   "6b96c904b40f8032036274200c1d20dfc790ee17722900743b9b34972cc64ffb")
  (:PATH "snapshots/memory-before-quota-fix.lisp.txt" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/memory-before-quota-fix.lisp.txt")
   :BYTES 9841 :SHA256
   "151993ee150cfe34198db0c64c9b9e969bedbae08074e51e11503206e55c4566")
  (:PATH "snapshots/pre-review-identities.txt" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/pre-review-identities.txt")
   :BYTES 225 :SHA256
   "5adffa839ce01bb9dc0440cae990db522809cdc2085f79ab09332503c497821b")
  (:PATH
   "source-before-final-qa/docs/implementazione/indice-automatico-operativo.md.txt"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-before-final-qa/docs/implementazione/indice-automatico-operativo.md.txt")
   :BYTES 7200 :SHA256
   "1a2058ccb98cdaa3091b247114c4ac04553ac802344039202851eed4c78e13cc")
  (:PATH "source-before-final-qa/src/engine/index-auto-memory.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-before-final-qa/src/engine/index-auto-memory.lisp.txt")
   :BYTES 9841 :SHA256
   "151993ee150cfe34198db0c64c9b9e969bedbae08074e51e11503206e55c4566")
  (:PATH "source-before-final-qa/tests/engine/index-automatic.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-before-final-qa/tests/engine/index-automatic.lisp.txt")
   :BYTES 15722 :SHA256
   "7682d9c11e0a46d6c3e7d2d94a6a8af603fa098721085d3e05c9f95a575b87b1")
  (:PATH "source-final-identities.txt" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final-identities.txt")
   :BYTES 10352 :SHA256
   "a0ecb965740f0de9bf12ea5840b9c0934c8a6f379bbb8e6a3417f019c4b7edf1")
  (:PATH "source-final/CHANGELOG.md.txt" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/CHANGELOG.md.txt")
   :BYTES 45868 :SHA256
   "10b6ab84ca24d4e2f9caee8e37663fd93b7e4e689462223e39526384d77f90fc")
  (:PATH "source-final/README.md.txt" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/README.md.txt")
   :BYTES 1573 :SHA256
   "c4eb73ea2734088fe4d26b14d8a2bb26f4b887e4725d7f170ab3ba829841fc8c")
  (:PATH "source-final/arcdocdb.asd.txt" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/arcdocdb.asd.txt")
   :BYTES 29825 :SHA256
   "d2e918d40d75726c7f0651e39b25ca97dd1c1b1a93f2de57f2cfba85e6b4542c")
  (:PATH "source-final/docs/adr/0067-delta-seriale-indice-m1.md.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/adr/0067-delta-seriale-indice-m1.md.txt")
   :BYTES 2757 :SHA256
   "5e3ad4243110aac5f287b96347cc23d5f087f5b2dfb4f7de0e14baf50e26e15a")
  (:PATH "source-final/docs/adr/0071-delta-location-indice-m1.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/adr/0071-delta-location-indice-m1.md.txt")
   :BYTES 3078 :SHA256
   "7aea34147645dc4a898861102b750720396437e2c22f6a40afc1ea2a8e01850a")
  (:PATH "source-final/docs/adr/0072-rinnovo-automatico-delta-m1.md.txt"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/adr/0072-rinnovo-automatico-delta-m1.md.txt")
   :BYTES 2714 :SHA256
   "1af8e13b38efa61b04d83d6c255b1e7d1c189bcfc07b5d68d9797c98c3001652")
  (:PATH "source-final/docs/adr/0073-indice-automatico-operativo-m1.md.txt"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/adr/0073-indice-automatico-operativo-m1.md.txt")
   :BYTES 3763 :SHA256
   "00a57939d1bbd71d950a6d30835af47747e3cfdcafc4358c7b28502b3bbdf394")
  (:PATH "source-final/docs/adr/README.md.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/adr/README.md.txt")
   :BYTES 15273 :SHA256
   "313fda23b62bdb252978f29a7c398c5309117a81cd72399cb63016c77fc930a1")
  (:PATH "source-final/docs/implementazione/README.md.txt" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/README.md.txt")
   :BYTES 3081 :SHA256
   "5202c40a697712243eb792a7239604bb6d2bcd921c237faad9b96cc685544711")
  (:PATH "source-final/docs/implementazione/delta-indice-m1.md.txt" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/delta-indice-m1.md.txt")
   :BYTES 4519 :SHA256
   "160d6a8e1e035161c82e242d0419e55ee20ade254deebeb14eb3bb58c478bbe5")
  (:PATH "source-final/docs/implementazione/delta-location-m1-metodo.md.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/delta-location-m1-metodo.md.txt")
   :BYTES 4265 :SHA256
   "664ce35f5746a860a87becc473c7b33e4322ba0cdc988f6c6318d573b633edbc")
  (:PATH "source-final/docs/implementazione/delta-location-m1.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/delta-location-m1.md.txt")
   :BYTES 4408 :SHA256
   "a540ff9d7a9c18241cd9ef192cceb5ad32e8f578ff9036f285e1f197f746770a")
  (:PATH
   "source-final/docs/implementazione/indice-automatico-completamento-metodo.md.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/indice-automatico-completamento-metodo.md.txt")
   :BYTES 2451 :SHA256
   "80aa0090aef4b31baf2c2c7e2becce4bef5d4ddbeb48480340df6e8c823c01f2")
  (:PATH "source-final/docs/implementazione/indice-automatico-operativo.md.txt"
   :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/indice-automatico-operativo.md.txt")
   :BYTES 7318 :SHA256
   "092152d9073cc8b7e59a74e816051d85fc534ac3a55bc47c716f4c829a89442d")
  (:PATH "source-final/docs/implementazione/indice-automatico.md.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/indice-automatico.md.txt")
   :BYTES 10273 :SHA256
   "40fce425f2246e603e8e4cc820ab647acfeffde8810620e6689f309ef4e8df73")
  (:PATH "source-final/docs/implementazione/manutenzione-indice-m1.md.txt"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/manutenzione-indice-m1.md.txt")
   :BYTES 4020 :SHA256
   "7970276db1edf689a8010ab44650b959d54d35f20b577d73cc30fd3003dd2530")
  (:PATH
   "source-final/docs/implementazione/rinnovo-automatico-m1-metodo.md.txt"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/rinnovo-automatico-m1-metodo.md.txt")
   :BYTES 2476 :SHA256
   "2dbe6abd35413a1b804c3eea33075c30cf9775cf3adb78d50094ce5a262e752f")
  (:PATH "source-final/docs/implementazione/rinnovo-automatico-m1.md.txt"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/implementazione/rinnovo-automatico-m1.md.txt")
   :BYTES 5449 :SHA256
   "050dae4d6326124cd23b4aa06c2c3dd46cf248c05c7b8f6fed853d30d342853a")
  (:PATH "source-final/docs/invarianti.md.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/invarianti.md.txt")
   :BYTES 21971 :SHA256
   "7bd4fb90feda603c2642b42966f7297a4a2f803a05e31a6a90e6d5731984b116")
  (:PATH "source-final/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/tracciabilita/matrice.md.txt")
   :BYTES 65840 :SHA256
   "f5ca19f462250f2675223f8f284398db50f3b47bd48195bcc9c2d26d4980eaaa")
  (:PATH "source-final/docs/tracciabilita/requisiti.lisp.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/docs/tracciabilita/requisiti.lisp.txt")
   :BYTES 50489 :SHA256
   "b126ee9a31d94f96ea324083a05fa20972a1dd5088709b2efd1ea504e240bac3")
  (:PATH "source-final/src/engine/adopt.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/adopt.lisp.txt")
   :BYTES 6676 :SHA256
   "5bfed7e43533f89432d765b7749b2fd5cbba654a818d7e0e735957cd0de7e869")
  (:PATH "source-final/src/engine/config.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/config.lisp.txt")
   :BYTES 3166 :SHA256
   "8fd7a099377e578ef2db6dce93f6f258718b4e6f3696916fd0e1c7c07768cfd9")
  (:PATH "source-final/src/engine/delta-location.lisp.txt" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/delta-location.lisp.txt")
   :BYTES 6991 :SHA256
   "8322209ceb11669521d8adb0eb73e0eae71822cf851b95c84fe6601a7bcc54a6")
  (:PATH "source-final/src/engine/delta-types.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/delta-types.lisp.txt")
   :BYTES 3873 :SHA256
   "465288cbf0af8f99f6b0d064794c2488983034eaf42a06da8050d96a3e3e87e1")
  (:PATH "source-final/src/engine/delta.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/delta.lisp.txt")
   :BYTES 4987 :SHA256
   "3ea372db67d4d88f49dfa0ac0d64fd5f8bfd186800619ab322f8dcfd88d20c91")
  (:PATH "source-final/src/engine/image-activation.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-activation.lisp.txt")
   :BYTES 7081 :SHA256
   "92fdc69a19bc1d72539bff7c47a3c91e219f96dcd5ddcbd3c0d67ff6e68fe6f7")
  (:PATH "source-final/src/engine/image-auto-types.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-auto-types.lisp.txt")
   :BYTES 877 :SHA256
   "0bdfadda6bcd86feb046f0c612cd31dd96f8a005ce0eb5a547083f437701005c")
  (:PATH "source-final/src/engine/image-auto-write.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-auto-write.lisp.txt")
   :BYTES 5381 :SHA256
   "f52a7ec8cc2d2af6c394ab3344f383cea0c824e0b18d3c7339e7b26cf58d1367")
  (:PATH "source-final/src/engine/image-auto.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-auto.lisp.txt")
   :BYTES 3569 :SHA256
   "1f5e31c62ef2ef13b355af03025bd995b7bac0003996a0474e5597d465f57885")
  (:PATH "source-final/src/engine/image-build.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-build.lisp.txt")
   :BYTES 3533 :SHA256
   "a8f0f64b40c6484689d9f8d335c610a2b0874ac40d029da17066c176a5e95ad4")
  (:PATH "source-final/src/engine/image-maintenance-config.lisp.txt" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-maintenance-config.lisp.txt")
   :BYTES 1118 :SHA256
   "e4b4bee611abb17d4d54e0029c2133fad2d8293887004f6117cd03a342ee4f40")
  (:PATH "source-final/src/engine/image-maintenance.lisp.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-maintenance.lisp.txt")
   :BYTES 3926 :SHA256
   "1f841df1d698649b1a4142030da36756aa1df6a0bdb71358986be8bb6791f6a9")
  (:PATH "source-final/src/engine/image-renewal.lisp.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-renewal.lisp.txt")
   :BYTES 5059 :SHA256
   "f80a0359d03e7fba9c5b441f031602e6864f89ddfb4ec27fe20b0d607c88512a")
  (:PATH "source-final/src/engine/image-source.lisp.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/image-source.lisp.txt")
   :BYTES 5113 :SHA256
   "e4d8405d299f3b800f831be185ae23de9f0cbe90c20188801a467b4efa1bf914")
  (:PATH "source-final/src/engine/index-auto-api.lisp.txt" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-api.lisp.txt")
   :BYTES 4011 :SHA256
   "dfb71e800b49f951faaea7681f5969ac4b9df5deb9b70ebeaf62d0e2306feedc")
  (:PATH "source-final/src/engine/index-auto-apply.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-apply.lisp.txt")
   :BYTES 4856 :SHA256
   "b7ca5661dba389d8ac8f82a4ac37423e97a26b0e13ef5cfab1a2c02c8b2303cb")
  (:PATH "source-final/src/engine/index-auto-files.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-files.lisp.txt")
   :BYTES 7567 :SHA256
   "65463b713fc0ed79946e9b7ff52cecbe7c548d6c36eb0279c18fbdf256ff99e5")
  (:PATH "source-final/src/engine/index-auto-memory.lisp.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-memory.lisp.txt")
   :BYTES 9863 :SHA256
   "0c9c73ed246b4f3dfa6984ae13a932746fc5ec0bdd186f360ac073811edbeefe")
  (:PATH "source-final/src/engine/index-auto-migrate.lisp.txt" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-migrate.lisp.txt")
   :BYTES 8616 :SHA256
   "4dfd60213946814310d01c69b7092aab380cef70a6be64d7b790b7f6a0a268c3")
  (:PATH "source-final/src/engine/index-auto-resolver.lisp.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-resolver.lisp.txt")
   :BYTES 4568 :SHA256
   "a04860b7954b3a558ca6eb9e8c04e0eebd713948a44b4579fc1733d2b5585aac")
  (:PATH "source-final/src/engine/index-auto-types.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index-auto-types.lisp.txt")
   :BYTES 2782 :SHA256
   "2e8060f405a375e436d7d5e5f5d774f85143712dddb637b6b7bbaf64c4a22173")
  (:PATH "source-final/src/engine/index.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/index.lisp.txt")
   :BYTES 5450 :SHA256
   "125758e677cc051abe3f59059f17dd7b5119fe5ab9d0475337bbc0cf5ba518b9")
  (:PATH "source-final/src/engine/lifecycle.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/lifecycle.lisp.txt")
   :BYTES 6580 :SHA256
   "bbc8dd306cd205a191464322ec64fa0ee2819ab4f6bde8208c715878a7fb5d8a")
  (:PATH "source-final/src/engine/package.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/package.lisp.txt")
   :BYTES 2124 :SHA256
   "8aaa64d7de025aba76322c4033877193690cd9b5d5bd2af7a0cb9c20f1ef8692")
  (:PATH "source-final/src/engine/read.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/read.lisp.txt")
   :BYTES 5848 :SHA256
   "8dd0cf525725f3356f86fff8e041c564747a2eca49086a76af414a786b917f27")
  (:PATH "source-final/src/engine/startup.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/startup.lisp.txt")
   :BYTES 7150 :SHA256
   "d1943d04db968aec0322e9501a9611b938ca82a3a49a12a2638c6be3b7b6c9a7")
  (:PATH "source-final/src/engine/types.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/types.lisp.txt")
   :BYTES 3752 :SHA256
   "819d72d301f66c5491cc43407b9656567f7e0d4e1c72a4937659d70bf961abc6")
  (:PATH "source-final/src/engine/write.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/engine/write.lisp.txt")
   :BYTES 8693 :SHA256
   "7e98968e399b60cb5b10c154318e9fc2c2697497dea3110e6edacf931ac547c8")
  (:PATH "source-final/src/get-resolver/read.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/get-resolver/read.lisp.txt")
   :BYTES 7437 :SHA256
   "b0591550b864ea4ed51c405afa48483dd35a620f95ba563851cf44bc83addaa1")
  (:PATH "source-final/src/get-resolver/types.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/get-resolver/types.lisp.txt")
   :BYTES 1849 :SHA256
   "42f3aac7096d111a5bf985ad7a379e5cc9bea5302a7d122d52258ab01e493996")
  (:PATH "source-final/src/get/build.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/get/build.lisp.txt")
   :BYTES 4244 :SHA256
   "8865ed17835aef9c4113e329e844063a73c3f8d65702476723ceceefff02c9b7")
  (:PATH "source-final/src/get/types.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/get/types.lisp.txt")
   :BYTES 4598 :SHA256
   "8dfb787b8f45453e824d218190f714b91e7d9dd139147ed9ef353e5524c45837")
  (:PATH "source-final/src/index-disk/api.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/api.lisp.txt")
   :BYTES 5263 :SHA256
   "c7a14be3b1d2d5b604a2caa902907fa392f0fc834e4fdfc89bb8e56b9a1ac552")
  (:PATH "source-final/src/index-disk/balance.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/balance.lisp.txt")
   :BYTES 3524 :SHA256
   "62d9e3139392275d7d12cae40c79368f1ac8561fd772ba8b8db65b9ec7cb945e")
  (:PATH "source-final/src/index-disk/build.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/build.lisp.txt")
   :BYTES 5224 :SHA256
   "17281a326a94547d836073c6f09e456916d312fda92b5f09b05a98ac7fd6c333")
  (:PATH "source-final/src/index-disk/cache.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/cache.lisp.txt")
   :BYTES 4240 :SHA256
   "ca9a22eb16996cc4773c232cfa8cd8364d4161171f209a2aa6a966b66e213ddd")
  (:PATH "source-final/src/index-disk/copy.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/copy.lisp.txt")
   :BYTES 4189 :SHA256
   "e207be2ea3e610032a3841e1145b35d8d42b93c2a3002f4872e3a7951fea7b6d")
  (:PATH "source-final/src/index-disk/mutate.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/mutate.lisp.txt")
   :BYTES 3703 :SHA256
   "7cd7206d4a00801048131d71b27abdcd5dbf8a08229e7f5755cc1602bcdac2d0")
  (:PATH "source-final/src/index-disk/package.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/package.lisp.txt")
   :BYTES 961 :SHA256
   "6253db262030dda083a52ba7091b78abf538ed1f32b585f6f6feaa6bf8edca29")
  (:PATH "source-final/src/index-disk/read.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/read.lisp.txt")
   :BYTES 7844 :SHA256
   "524e7d7acd6cd05992c3754d855f1f35a608f3d115229eed1696153a78e1a4f8")
  (:PATH "source-final/src/index-disk/types.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/types.lisp.txt")
   :BYTES 6599 :SHA256
   "edd640e5cc9ef718a44d85011965384b771499df13540ddd86cea5089d0d1ac1")
  (:PATH "source-final/src/index-disk/visit.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/visit.lisp.txt")
   :BYTES 6211 :SHA256
   "e1ed5c8dbe00c48c0e01e29670795a50a862d26d6fc27d7e0c898d816d43ebb0")
  (:PATH "source-final/src/index-disk/write.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/index-disk/write.lisp.txt")
   :BYTES 5959 :SHA256
   "2646c0b630113c6a73c25006e3e1191c0e3ef0b1c2e95411b1aa13662e321dc4")
  (:PATH "source-final/src/io/derived-remove.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/io/derived-remove.lisp.txt")
   :BYTES 4175 :SHA256
   "d0d3ac184aeac9a5c875b1549c68fd7c6a83d1688126980210f744838fc21f79")
  (:PATH "source-final/src/io/package.lisp.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/io/package.lisp.txt")
   :BYTES 1153 :SHA256
   "272955b74f9d206dbc9b9457715873d195a4b2d9828858480dd222c3816cac96")
  (:PATH "source-final/src/io/types.lisp.txt" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/src/io/types.lisp.txt")
   :BYTES 6411 :SHA256
   "2f17414beaf7df39132299ff603558e03c53e766eb4f992fb71871a669192cc2")
  (:PATH "source-final/tests/engine/delta-location.lisp.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/delta-location.lisp.txt")
   :BYTES 16212 :SHA256
   "727831dd43127157c228d80cc227217ba6bc29dee795dedad447ff7f07d204cc")
  (:PATH "source-final/tests/engine/delta.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/delta.lisp.txt")
   :BYTES 11892 :SHA256
   "0de534e3db1d15c6b3364056b598ed5d98ac041553a5dea56f74e3b94cc1cf10")
  (:PATH "source-final/tests/engine/image-auto.lisp.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/image-auto.lisp.txt")
   :BYTES 23129 :SHA256
   "99cdcbb8817c2b09a0b758ab9cc6779b9f606fdf5b18c1c574c43a156e03b9d6")
  (:PATH "source-final/tests/engine/image-build.lisp.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/image-build.lisp.txt")
   :BYTES 18184 :SHA256
   "4aaced115a44cd0b3af38385c49fe4069ccca13eb2b5013807c7e8a54fd6717a")
  (:PATH "source-final/tests/engine/index-auto-disk.lisp.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/index-auto-disk.lisp.txt")
   :BYTES 13619 :SHA256
   "11be95609c3bf675d57618a957a811b549aedd760c4e979ea10482cbeaf4f5c9")
  (:PATH "source-final/tests/engine/index-automatic.lisp.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/index-automatic.lisp.txt")
   :BYTES 16382 :SHA256
   "299e25572ca363ca88002f841034660aaf7a97eeb3c1a417b7a372781b9a1dbd")
  (:PATH "source-final/tests/engine/processes.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/processes.lisp.txt")
   :BYTES 6516 :SHA256
   "a94e21153975e6710690cae6ab37b31ed59f7e1b93dbc27ae43f91ce740ab66d")
  (:PATH "source-final/tests/engine/support.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/engine/support.lisp.txt")
   :BYTES 5494 :SHA256
   "8c9468d741b75fa8ade496831d760888bee3483fc2023f65b91a730164889aa9")
  (:PATH "source-final/tests/local/server.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/source-final/tests/local/server.lisp.txt")
   :BYTES 9667 :SHA256
   "2611ef7e52eb874f91cd2620f6efc78b2253dab4abb009232430b2d5224ee2a4")
  (:PATH "supplemental-before-retirement-review.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/supplemental-before-retirement-review.lisp")
   :BYTES 348 :SHA256
   "f8cef75b4491fc78501cba787374a2cc33764ada74c8f617505c785b97ed5035")
  (:PATH "supplemental-before-retirement-review.lisp.gz" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/supplemental-before-retirement-review.lisp.gz")
   :BYTES 101577 :SHA256
   "9f1fc95f7965260f79cbc3a13b099b5ea88d22891c95c3ad46c9f97ceaec28d7")
  (:PATH "targeted-before-retirement-review.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/targeted-before-retirement-review.lisp")
   :BYTES 344 :SHA256
   "67f6f76437a45d10864edfd35d074e0bb2c04b8ded4cb163909596c0af3ed197")
  (:PATH "targeted-before-retirement-review.lisp.gz" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/targeted-before-retirement-review.lisp.gz")
   :BYTES 103072 :SHA256
   "b6e0624d78dedd4c8a5a877d6a40c92f710844fa4dbb78aae6f7e1cbf3f639be")
  (:PATH "targeted-final-2.6.10.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/targeted-final-2.6.10.lisp")
   :BYTES 332 :SHA256
   "51e39b27eee544d27cd494582bd37bf0199406cbe172eedad866d2f4d7e00a83")
  (:PATH "targeted-final-2.6.10.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/auto-completion/archive-input/targeted-final-2.6.10.lisp.gz")
   :BYTES 103112 :SHA256
   "93eae83d0e28409016ca7abb57fa366032831ff2563bdb3ae4b89a91eb4832b0"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
