(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "targeted-attempt-01-failed" :RECORD-PATH
   "targeted-attempt-01-failed.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "spikes/out/m1-location-delta/check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-attempt-02-failed" :RECORD-PATH
   "targeted-attempt-02-failed.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "spikes/out/m1-location-delta/check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-attempt-03-failed" :RECORD-PATH
   "targeted-attempt-03-failed.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "spikes/out/m1-location-delta/check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-pre-review-2.6.10" :RECORD-PATH
   "targeted-pre-review-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "spikes/out/m1-location-delta/check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-pre-review-2.6.10" :RECORD-PATH
   "allocation-pre-review-2.6.10.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-attempt-01-changed" :RECORD-PATH "full-attempt-01-changed.lisp"
   :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :CHANGED)
  (:LABEL "targeted-pre-review-2.6.9" :RECORD-PATH
   "targeted-pre-review-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-pre-review-2.6.9" :RECORD-PATH
   "allocation-pre-review-2.6.9.lisp" :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-attempt-01-failed" :RECORD-PATH "ci-attempt-01-failed.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((37) BASE-CHAR . "spikes/out/ci/selftest-1793424646-216"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-final-2.6.10" :RECORD-PATH "targeted-final-2.6.10.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-attempt-02-toolchain-mismatch" :RECORD-PATH
   "full-attempt-02-toolchain-mismatch.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-attempt-02-failed" :RECORD-PATH "ci-attempt-02-failed.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/m1-location-delta/ci-recheck"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-final-2.6.10" :RECORD-PATH "allocation-final-2.6.10.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/allocation.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-data-diagnostic" :RECORD-PATH "ci-data-diagnostic.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((47) BASE-CHAR . "spikes/out/m1-location-delta/ci-data-debug.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-data-no-status-diagnostic" :RECORD-PATH
   "ci-data-no-status-diagnostic.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/m1-location-delta/ci-context-debug.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-exact-diagnostic" :RECORD-PATH "ci-exact-diagnostic.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/m1-location-delta/ci-exact-debug.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "allocation-final-2.6.9" :RECORD-PATH "allocation-final-2.6.9.lisp"
   :COMMAND
   (#A((40) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl")
    #A((20) BASE-CHAR . "--dynamic-space-size") #A((4) BASE-CHAR . "2048")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/results/2026-10-31-engine-location-delta/allocation.lisp"))
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
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793425873-13632"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "allocation-final-2.6.10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-final-2.6.10.lisp")
   :BYTES 333 :SHA256
   "985535a813a1686d3da27e76ebc77c46a5b5bf15ad1a50b3035a805518b56a76")
  (:PATH "allocation-final-2.6.10.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-final-2.6.10.lisp.gz")
   :BYTES 99539 :SHA256
   "bc048e9db59ac1b5ca88c361d5404dbde2d8d4be8fd7cf10fd284b8f81d4d6ca")
  (:PATH "allocation-final-2.6.9.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-final-2.6.9.lisp")
   :BYTES 332 :SHA256
   "85afd3fd93583b99946c0012f4aab5e6e291eea082c12ca844bff2a20c8ac6ea")
  (:PATH "allocation-final-2.6.9.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-final-2.6.9.lisp.gz")
   :BYTES 99564 :SHA256
   "6f007150172710b2a0cce5615031a8f0ca31ec4240a74bc93d2b7bc257959593")
  (:PATH "allocation-pre-review-2.6.10.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-pre-review-2.6.10.lisp")
   :BYTES 338 :SHA256
   "c21b74af0f31ae4c4f19e46618b2d3932b6843626532a482bddbe0ca6c17665a")
  (:PATH "allocation-pre-review-2.6.10.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-pre-review-2.6.10.lisp.gz")
   :BYTES 99547 :SHA256
   "814fe1552215f18287ddd7352f5ba9fcd171c66f8f2377a19ea109c753af5554")
  (:PATH "allocation-pre-review-2.6.9.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-pre-review-2.6.9.lisp")
   :BYTES 337 :SHA256
   "b18f8c7285da2496f04dcd194616a9e09e784dd818eaf28f690c3efc1bca9eb1")
  (:PATH "allocation-pre-review-2.6.9.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation-pre-review-2.6.9.lisp.gz")
   :BYTES 99575 :SHA256
   "80583d69d0b7f856d87f98c7f3e988dce0a34c0872eba646053b35f9f017f062")
  (:PATH "allocation.lisp" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/allocation.lisp")
   :BYTES 4285 :SHA256
   "9d5a84e48646074ff9d86e672a5ef92b23d85f9296ca6a59cb69a02f985b8705")
  (:PATH "ci-attempt-01-failed.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-attempt-01-failed.lisp")
   :BYTES 329 :SHA256
   "2c3b3b99d57d92c34a780077af2250bb51b83a0751fbe2f485b324d5ba509301")
  (:PATH "ci-attempt-01-failed.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-attempt-01-failed.lisp.gz")
   :BYTES 99410 :SHA256
   "41df298f4d71bea45ecb6acfd1cc12080ee98693b2782c8e3124488d5f087759")
  (:PATH "ci-attempt-02-failed.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-attempt-02-failed.lisp")
   :BYTES 329 :SHA256
   "4d3e86620882d0ac89735d51822349808626c2cfc709a6ce42de62db704d52f4")
  (:PATH "ci-attempt-02-failed.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-attempt-02-failed.lisp.gz")
   :BYTES 99403 :SHA256
   "6dcf46ffac146aa98a5edc43f5002888462d768f7c977b0bf02673e90d2a0425")
  (:PATH "ci-data-diagnostic.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-data-diagnostic.lisp")
   :BYTES 327 :SHA256
   "365c3931933f6a4b050fbf4750763cbd7c81a589e395da8e994cfaf21d59aaf9")
  (:PATH "ci-data-diagnostic.lisp.gz" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-data-diagnostic.lisp.gz")
   :BYTES 99376 :SHA256
   "12632c2045f0a81f0e0efedb1f79195b6bf4d328632d06fcde7bf2758137a90a")
  (:PATH "ci-data-no-status-diagnostic.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-data-no-status-diagnostic.lisp")
   :BYTES 338 :SHA256
   "10e9260ab6159a86faea3ed42bb09d32d8581363fd4d523bc72dba4cb18b2e07")
  (:PATH "ci-data-no-status-diagnostic.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-data-no-status-diagnostic.lisp.gz")
   :BYTES 99319 :SHA256
   "cc973f203fcf6ae39da9d5047394136695601e256acfc253edcef3a8561b25aa")
  (:PATH "ci-exact-diagnostic.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-exact-diagnostic.lisp")
   :BYTES 328 :SHA256
   "495e5bf0003a5aa5e9342cbdc0a07d21600b4d4304512bbe13d397a8aec73209")
  (:PATH "ci-exact-diagnostic.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-exact-diagnostic.lisp.gz")
   :BYTES 99377 :SHA256
   "20880a69747d4fb212c8f3d3bb5dabc02f46e6a0929ecd456d118ece6a980f2b")
  (:PATH "ci-final-2.6.9.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-final-2.6.9.lisp")
   :BYTES 323 :SHA256
   "43003f01eb2e5f8d96f22e9375aa52a9b1012f01a905b16096f4e8781e96338f")
  (:PATH "ci-final-2.6.9.lisp.gz" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/ci-final-2.6.9.lisp.gz")
   :BYTES 99426 :SHA256
   "7426fd6ed46129dae80e83cb7d5d8ee6b5ea429eb4f993570841cfa43188de0e")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/collection-input.lisp")
   :BYTES 11705 :SHA256
   "eeec492a0d112ca45352130ff067f7317c0eb9f0d7ffd6c14f023afdf4dfa597")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "diagnostics/ci-context-debug.lisp.txt" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/ci-context-debug.lisp")
   :BYTES 1419 :SHA256
   "756a68fae40c570903be5a79f2126486933d68d7bf7e4e5d5ccfef557801b358")
  (:PATH "diagnostics/ci-data-debug.lisp.txt" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/ci-data-debug.lisp")
   :BYTES 1550 :SHA256
   "365f2b9c19ba4422f082605cc702725c231bcc7cf8318d5acfd72ab5dd86718a")
  (:PATH "diagnostics/ci-data-diagnostic-source.lisp.txt" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/ci-data-diagnostic-source.lisp")
   :BYTES 28924 :SHA256
   "4522509375fc34425106464dec071f37e60189e48acce81f4a77fbc36090ae62")
  (:PATH "diagnostics/ci-exact-debug.lisp.txt" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/ci-exact-debug.lisp")
   :BYTES 985 :SHA256
   "41661723a844b59e66bab6d26e1a64eecde592010416bb7be5295451fff9df6b")
  (:PATH "diagnostics/prepare-ci-debug.lisp.txt" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/prepare-ci-debug.lisp")
   :BYTES 844 :SHA256
   "07e3dcfaac133673f55021d0a5b9324acac3a36f884d9b360bd951ab548d5a4d")
  (:PATH "full-attempt-01-changed.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-attempt-01-changed.lisp")
   :BYTES 335 :SHA256
   "ddcec4536380ab1a48dedbdb75db2df680a382e1e09697c000c1bb41d5d296aa")
  (:PATH "full-attempt-01-changed.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-attempt-01-changed.lisp.gz")
   :BYTES 319023 :SHA256
   "0cf12a175ba5cf5d0d94782b2874d0d80c9e0338c171af111f1b0cc2278168ef")
  (:PATH "full-attempt-02-toolchain-mismatch.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-attempt-02-toolchain-mismatch.lisp")
   :BYTES 346 :SHA256
   "135597bed348394345c3fce2482db47d2d592b348cf4d9d45004a38520a57e32")
  (:PATH "full-attempt-02-toolchain-mismatch.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-attempt-02-toolchain-mismatch.lisp.gz")
   :BYTES 314497 :SHA256
   "5e1a22c4c4aebf4fb3f2f4e688ae3d9fc8ad834235a4202a766e1dd5aeb7fce0")
  (:PATH "full-final-2.6.9.lisp" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-final-2.6.9.lisp")
   :BYTES 327 :SHA256
   "de6c3d25a5567633c612ce8907831063c99725b85c64fa95c11d60be0b0c4407")
  (:PATH "full-final-2.6.9.lisp.gz" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/full-final-2.6.9.lisp.gz")
   :BYTES 323466 :SHA256
   "5484162a94559607dc3ff6e59f7235c6cfadfe1f76ff7cc3d54d1397b88260dc")
  (:PATH "report.md" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/report.md")
   :BYTES 7609 :SHA256
   "f18ca0bd39d361cc6771dc735500e220ef3226b081dc16a49f928e514b8040c0")
  (:PATH "snapshots/product-pre-review.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/snapshots/product-pre-review.lisp.txt")
   :BYTES 6337 :SHA256
   "b353704b0ac352bd8f48d9243852d1a3ec461499044d45a7f3462518e5062e64")
  (:PATH "snapshots/tests-attempt-01.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/snapshots/tests-attempt-01.lisp.txt")
   :BYTES 8860 :SHA256
   "95afcffdcc98bdcdde7fdf50fe133b3a4ef1cca666dd9046c1c09878bfedba4c")
  (:PATH "snapshots/tests-attempt-02.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/snapshots/tests-attempt-02.lisp.txt")
   :BYTES 16001 :SHA256
   "297e6333dc705af196e820210bc155cb37e9c60bd8aa3424036dd413ab0a1906")
  (:PATH "snapshots/tests-attempt-03.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/snapshots/tests-attempt-03.lisp.txt")
   :BYTES 16000 :SHA256
   "933e1c56c50d5b1cd0bc1cb089f823ee2ea95c857581bc5f2e0a450eb4b4c4d5")
  (:PATH "snapshots/tests-pre-review.lisp.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/snapshots/tests-pre-review.lisp.txt")
   :BYTES 16049 :SHA256
   "bb0166b8272de7d18270d534a63ccd38297cdf84c58d3b1b7d76dd048f664cb1")
  (:PATH "targeted-attempt-01-failed.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-01-failed.lisp")
   :BYTES 337 :SHA256
   "b5d521c65f597cde80d6bdcc25c443694dd875472b938de82ce65f55cb9fcd01")
  (:PATH "targeted-attempt-01-failed.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-01-failed.lisp.gz")
   :BYTES 101534 :SHA256
   "581bedf97ac65c6cfd325de358a059972c32a0858cf8cadeb554a6dd4bdd9d6b")
  (:PATH "targeted-attempt-02-failed.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-02-failed.lisp")
   :BYTES 337 :SHA256
   "9d814d02f7f447a6c6743bb76f415facc9e1641f9e57fa919c7fc3ad819b27c5")
  (:PATH "targeted-attempt-02-failed.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-02-failed.lisp.gz")
   :BYTES 101321 :SHA256
   "10e862821b0a5923036fbefa6252770d174590b8b5d8515e3d03b61f34f95819")
  (:PATH "targeted-attempt-03-failed.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-03-failed.lisp")
   :BYTES 337 :SHA256
   "4052347fac4b19ec1585100be67b502688ff9e558efbb1f6d37a16812b8ca5a9")
  (:PATH "targeted-attempt-03-failed.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-attempt-03-failed.lisp.gz")
   :BYTES 101537 :SHA256
   "7e0dd81c8473f9e627441b4ba9dedf727550c7c5a03841e29e52649c8293c39e")
  (:PATH "targeted-final-2.6.10.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-final-2.6.10.lisp")
   :BYTES 332 :SHA256
   "25b315f1dcf7ff196921de5577928ff233340bbcae63129e14440743b6fc5bfc")
  (:PATH "targeted-final-2.6.10.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-final-2.6.10.lisp.gz")
   :BYTES 100604 :SHA256
   "78170ba97b09b44df889bb63458e6c84db62bd954e44118c0fa4ec5bc2b33403")
  (:PATH "targeted-pre-review-2.6.10.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-pre-review-2.6.10.lisp")
   :BYTES 337 :SHA256
   "1530be980707c277d90b97bce7cac2d705f230b024be4176e2911c207cff284a")
  (:PATH "targeted-pre-review-2.6.10.lisp.gz" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-pre-review-2.6.10.lisp.gz")
   :BYTES 100557 :SHA256
   "c0abc7d4e14dee22ef0799e80f034b5e4e2cedbb0aa5747bcb274a531bed58c5")
  (:PATH "targeted-pre-review-2.6.9.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-pre-review-2.6.9.lisp")
   :BYTES 336 :SHA256
   "01f03f644f3002144541ef57eb8ca139a7b5d93f2482812370cebb3f7e4ab22d")
  (:PATH "targeted-pre-review-2.6.9.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted-pre-review-2.6.9.lisp.gz")
   :BYTES 100638 :SHA256
   "af67ca03bcfcbb333e26d915f57a470568ff6fe29e0375966d1739798397b590")
  (:PATH "targeted.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/m1-location-delta/archive-input/targeted.lisp")
   :BYTES 894 :SHA256
   "6015873d91f8d6b40df858a7e8dfba0ca89c9f3b97eee04c4109d3f0657b045e"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
