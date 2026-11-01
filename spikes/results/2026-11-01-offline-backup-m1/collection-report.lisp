(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((136) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection-observations/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-offline-backup-m1-originals/"
   :INDEXED-FILES 66 :ACTUAL-FILES 68 :INDEXED-BYTES 9214823 :PROCESSES
   ((:LABEL "foundation-build" :RECORD-PATH
     "processes/foundation-build/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-load.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "first-product-build" :RECORD-PATH
     "processes/first-product-build/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-load.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "product-build-2" :RECORD-PATH
     "processes/product-build-2/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-load.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-1" :RECORD-PATH "processes/focused-1/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-1" :RECORD-PATH "processes/lint-1/report.lisp" :COMMAND
     ("make" "lint") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "cli-selftest-1" :RECORD-PATH
     "processes/cli-selftest-1/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/arcdocdb-backup.lisp" "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-2" :RECORD-PATH "processes/focused-2/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-3" :RECORD-PATH "processes/focused-3/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-4" :RECORD-PATH "processes/focused-4/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-5" :RECORD-PATH "processes/focused-5/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-6" :RECORD-PATH "processes/focused-6/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-7" :RECORD-PATH "processes/focused-7/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "reader-audit-1" :RECORD-PATH
     "processes/reader-audit-1/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-m1-reader.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "reader-audit-2" :RECORD-PATH
     "processes/reader-audit-2/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-m1-reader.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-8" :RECORD-PATH "processes/focused-8/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "late-corruption-reproduction" :RECORD-PATH
     "processes/late-corruption-reproduction/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-late-corruption.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "late-corruption-reproduction-2" :RECORD-PATH
     "processes/late-corruption-reproduction-2/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-late-corruption.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "focused-final" :RECORD-PATH "processes/focused-final/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-check.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp"
     :COMMAND ("make" "check-core") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-build" :RECORD-PATH "processes/docs-build/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-runtime" :RECORD-PATH "processes/docs-runtime/report.lisp"
     :COMMAND ("make" "docs-runtime-check" "docs-examples") :STATUS :OK
     :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "integration" :RECORD-PATH "processes/integration/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-m1-integration.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "integrated-docs" :RECORD-PATH
     "processes/integrated-docs/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "integrated-docs-runtime" :RECORD-PATH
     "processes/integrated-docs-runtime/report.lisp" :COMMAND
     ("make" "docs-runtime-check" "docs-examples") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check-ci-child" :RECORD-PATH
     "processes/full-check-ci-child/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out"
      "spikes/out/ci/selftest-1793539008-21075")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "40552ca1a995e2793d1b4752fa9a0059f500aaa740851615187f8393d1394659"
   :CATALOGUE-SHA256
   "1d5bb69eb80ce83982fa7bb2774fb52c4a686182331d5555c434b1a6aee8663e"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (21 22 1 22) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/foundation-build/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/foundation-build/report.lisp")
    :BYTES 347534 :SHA256
    "47af74a7745131e101b6fc0241f0f9b963140175396730b9f70fbf4ee86c710e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/foundation-build/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/foundation-build/conservazione.lisp")
    :BYTES 1165 :SHA256
    "3360ca6c60d411d3fe3e92b1d60fcbcc493e50a64499168294f5fbf8a3eac122"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/first-product-build/report.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/first-product-build/report.lisp")
    :BYTES 366347 :SHA256
    "b07c5b5e45b285ba078536137903502b159ea1f4dc5679da998e3c6ca67556bd"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/first-product-build/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/first-product-build/conservazione.lisp")
    :BYTES 1171 :SHA256
    "fa891d6063366580384f0308ad4be082a8483cb79f6ea729cbf325ac998211f0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/product-build-2/report.lisp") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/product-build-2/report.lisp")
    :BYTES 349411 :SHA256
    "c2b6ab795ae2e73b5944e5b9510309ac69007d81b0c4a6e9105afbc12300db72"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/product-build-2/conservazione.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/product-build-2/conservazione.lisp")
    :BYTES 1163 :SHA256
    "bd1ee77a477b72a360a01f9b917b948cd9c2e2a53c711f9e6eed8c594686a8e8"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-1/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-1/report.lisp")
    :BYTES 353582 :SHA256
    "6e220e430a8456725553027cad79e06b7a107e5446d59319b1dff37b853088b1"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-1/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-1/conservazione.lisp")
    :BYTES 1151 :SHA256
    "c58a5c06c1be13f890d0fa3dec1a38aead1f372f2c4d730f2706a114daef484f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((28) BASE-CHAR . "processes/lint-1/report.lisp") :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/lint-1/report.lisp")
    :BYTES 350261 :SHA256
    "db8e9ea7dc21f6c7aa442b1eeed68848cefdd48a6ebef58786a4bebec3ac8190"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/lint-1/conservazione.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/lint-1/conservazione.lisp")
    :BYTES 1145 :SHA256
    "ba6f913c7fec651eb4db783c5d1030477160a4dabbe53af5630377e5cc76ee90"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/cli-selftest-1/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/cli-selftest-1/report.lisp")
    :BYTES 350480 :SHA256
    "1e3e72bf8fd2a057143f47eaac4072bd76e917057978861a6d733fb7d2442892"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/cli-selftest-1/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/cli-selftest-1/conservazione.lisp")
    :BYTES 1161 :SHA256
    "e659bf88a4b9d1b6c0b36de7b82de209689e5f607901f6ee744274a73f0e8220"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-2/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-2/report.lisp")
    :BYTES 358826 :SHA256
    "d097ecfcaf76e4c037fa02cda93ef046f16a658581ad7ad2afb62a13acfff6a0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-2/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-2/conservazione.lisp")
    :BYTES 1151 :SHA256
    "8ec0195ffa2a1f935d253a3c50d7fb51b6506b0604be808bbfd7a07d526d9c05"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-3/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-3/report.lisp")
    :BYTES 355602 :SHA256
    "5f4f6fafb14201ededc8be28f8f9c213153c639fed698b2dbda2d0ba726727c0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-3/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-3/conservazione.lisp")
    :BYTES 1151 :SHA256
    "d2171ca4289d0794e1e5528925de4c478392dc1ad053ade0edb57b48b9bfbce8"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-4/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-4/report.lisp")
    :BYTES 359268 :SHA256
    "26f230fbca4981d971e0c34d6d7ebe57a1d4081b5380c895aba37214dc1d5471"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-4/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-4/conservazione.lisp")
    :BYTES 1151 :SHA256
    "68f353ccb5d5b90343567a892a786a661fcb6f0142c22022866e6f6223b877cc"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-5/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-5/report.lisp")
    :BYTES 356732 :SHA256
    "2fc057c54b661bbe3cc2e83acb50dc21d395e9a07c387b88cfeabb2939360d6c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-5/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-5/conservazione.lisp")
    :BYTES 1151 :SHA256
    "4b51ce9a6bab0d609582e20803d41b055997b1b5bd2632f6171bc13219180bad"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-6/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-6/report.lisp")
    :BYTES 359784 :SHA256
    "df3560b4b34a73f4267a53493fa446c589e19bbb76444adde4ce33313cb9ab7c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-6/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-6/conservazione.lisp")
    :BYTES 1151 :SHA256
    "a065a0d3529d9cbf1d148d9338b5d5540e7a2812d199160297ba7f81e29a4e3a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-7/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-7/report.lisp")
    :BYTES 359442 :SHA256
    "db15923acf4ef14042a936dcf5d5a5e3103b022996e96d7391e5a0e36f102090"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-7/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-7/conservazione.lisp")
    :BYTES 1151 :SHA256
    "11e31a9720aef97b60d9fbad6c9aa384f544fa9bc93dcdecd148bdc3fee7df77"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/reader-audit-1/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/reader-audit-1/report.lisp")
    :BYTES 352699 :SHA256
    "9d27152c4789d8a2c4502b630fc8a384c787182ef087f7b61b6fe6df0f2e694c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/reader-audit-1/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/reader-audit-1/conservazione.lisp")
    :BYTES 1161 :SHA256
    "c5df545fcae4353c173b565bc12ac6d8888837936be15959044dd75ab624e6f9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/reader-audit-2/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/reader-audit-2/report.lisp")
    :BYTES 352312 :SHA256
    "5416b36b28cf18e922fdb51c6c5c2b3930faa46f3439d467879b8efcc0a04aa0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/reader-audit-2/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/reader-audit-2/conservazione.lisp")
    :BYTES 1161 :SHA256
    "5f160efcc131fb6ae4a434e2872c1c19311683d90b5c64354554396f8bdf1b1c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/focused-8/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-8/report.lisp")
    :BYTES 360519 :SHA256
    "83d8d015ec1e6e2b0b3b7053a24400d04b417e4a008cb5b7d89652ad5a1c1efb"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/focused-8/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-8/conservazione.lisp")
    :BYTES 1151 :SHA256
    "d2b795c1e40eecccf002a5395df46903dfb929ba8606219f684a9210f560d1c7"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((50) BASE-CHAR . "processes/late-corruption-reproduction/report.lisp")
    :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/late-corruption-reproduction/report.lisp")
    :BYTES 360010 :SHA256
    "924242761360b091a47304301ab84ca514a8182612313e04f65ba1d43f65e6c0"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((57) BASE-CHAR
       . "processes/late-corruption-reproduction/conservazione.lisp")
    :SOURCE
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/late-corruption-reproduction/conservazione.lisp")
    :BYTES 1188 :SHA256
    "3dacf3ed139601b256d1864e3d5e0d78440aca5461ba74effc2155f6264472c5"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((52) BASE-CHAR . "processes/late-corruption-reproduction-2/report.lisp")
    :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/late-corruption-reproduction-2/report.lisp")
    :BYTES 356527 :SHA256
    "69167bce60769e2fd650f8fef09dc6a9430a78585dff63f0c47e8f5a13be1638"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((59) BASE-CHAR
       . "processes/late-corruption-reproduction-2/conservazione.lisp")
    :SOURCE
    #A((145) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/late-corruption-reproduction-2/conservazione.lisp")
    :BYTES 1192 :SHA256
    "c0ae224c2fadde9c614fffacac27d1e57ad286588a5cf41687842fdb1e2e9705"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/focused-final/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-final/report.lisp")
    :BYTES 360859 :SHA256
    "53ec7e52fde521042156cc570af0c85dc76f15ef54f169695104db2c0f6d4bd6"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/focused-final/conservazione.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/focused-final/conservazione.lisp")
    :BYTES 1158 :SHA256
    "2951d7d5f16ab05e79eca217e25861402ff71186ec97df4933f843ffd60521bc"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/full-check/report.lisp") :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/report.lisp")
    :BYTES 317 :SHA256
    "f58238308bdda35231a822a23f5284eeeff06b2506e444fca8722b1a3d79df23"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/full-check/report.lisp.gz") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/report.lisp.gz")
    :BYTES 369898 :SHA256
    "adbd7033cfe16bec91e33af456640af7b0f869f98d79cdbfdb14e3cb266315ba"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/full-check/conservazione.lisp")
    :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/full-check/conservazione.lisp")
    :BYTES 1739 :SHA256
    "13c2a9222df672f2f89ce66057101820c6042cd1f1ad995a33c47039eacc2d1d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/docs-build/report.lisp") :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/docs-build/report.lisp")
    :BYTES 354032 :SHA256
    "1c62ce9501049eebe7c8573a788099af3e9ed2c65639726938405624c4ecbfc2"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/docs-build/conservazione.lisp")
    :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/docs-build/conservazione.lisp")
    :BYTES 1152 :SHA256
    "d8c5e60f4d9c3e4349b2af7aa113260800357a9256d25f3904e9cf896021605e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/docs-runtime/report.lisp")
    :BYTES 351879 :SHA256
    "13354e742d8f7283e109bf882f40567bbcd667c0ab9037609536fe09454069fe"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/docs-runtime/conservazione.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/docs-runtime/conservazione.lisp")
    :BYTES 1157 :SHA256
    "13346b6372a6d7cb47b1c1aad2fecab397392bd2f1f2168c094ff632246cdac3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/integration/report.lisp") :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integration/report.lisp")
    :BYTES 549817 :SHA256
    "a14b46ecae9dfed7a63b817e9427f1e02b6acbc7ad46e580e68229b1756272a4"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/integration/conservazione.lisp")
    :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integration/conservazione.lisp")
    :BYTES 1155 :SHA256
    "600761a92ad7ba0b5d5074af04a09dedb7601bcb445c4828123471cade36b2e6"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/integrated-docs/report.lisp") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integrated-docs/report.lisp")
    :BYTES 356230 :SHA256
    "bc4f602e0e1acf52ce94dd8489afebf816e29e5d41d37b44c7d13847c922b94a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/integrated-docs/conservazione.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integrated-docs/conservazione.lisp")
    :BYTES 1163 :SHA256
    "162246491b47e1d61cc0612608a96336124857a7a6e85f33f8ded38998371f26"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/integrated-docs-runtime/report.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integrated-docs-runtime/report.lisp")
    :BYTES 354076 :SHA256
    "91f042f3e604d39bdad4d6165f353558787345ba319e163655576b44c47878d0"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((52) BASE-CHAR . "processes/integrated-docs-runtime/conservazione.lisp")
    :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/integrated-docs-runtime/conservazione.lisp")
    :BYTES 1179 :SHA256
    "b9938ef5789dbd758fccd3b974f2bb8260df9794af4c01c21c5d64a93a4229d3"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-ci-child/report.lisp" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002527808-command-21079-0/report.lisp")
    :BYTES 352433 :SHA256
    "6823b30ffeb2dbda9be7b02939ceeb270c5df62fdb6c0ba5e2538a703c2b1e2b"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-ci-child/conservazione.lisp" :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002527808-command-21079-0/conservazione.lisp")
    :BYTES 1147 :SHA256
    "f388f92e0832ec235b99a5d52203dc2cc0ade265b50c789b369890f51618699b"))
  (:STATUS :OK :ENTRY
   (:PATH "diagnostics/ci-tests.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793539008-21075/tests.lisp")
    :BYTES 2409 :SHA256
    "bdb3551f75c4e5288f9f8d76215b6b9e9ea152294f70625962c2d0435664e950"))
  (:STATUS :OK :ENTRY
   (:PATH "diagnostics/ci-summary.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793539008-21075/report.lisp")
    :BYTES 632 :SHA256
    "3bf53e3748c34568e0fb83b9f6f7ed394be5c711a74ca8b7bdde88a45f49bc23"))
  (:STATUS :OK :ENTRY
   (:PATH "method/focused-driver.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-m1-check.lisp")
    :BYTES 464 :SHA256
    "584819ba2da92f97e7e59b0895cb50adb5faf3af14341303ae545947851f8189"))
  (:STATUS :OK :ENTRY
   (:PATH "method/build-driver.lisp.txt" :SOURCE
    #A((92) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-m1-load.lisp")
    :BYTES 432 :SHA256
    "9b325e8f28ab5acdb554b3cf9d6edc0af5a3c95a02e0d66293fdbda8e307c751"))
  (:STATUS :OK :ENTRY
   (:PATH "method/syntax-driver.lisp.txt" :SOURCE
    #A((94) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-m1-reader.lisp")
    :BYTES 1469 :SHA256
    "fc72e4731e6760187e7a3f85556706c27e68d0d1ee52596faa09225e10f70f5a"))
  (:STATUS :OK :ENTRY
   (:PATH "method/regression-driver.lisp.txt" :SOURCE
    #A((103) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-m1-late-corruption.lisp")
    :BYTES 552 :SHA256
    "e238abf58b9dde33353a3847761cd82f8ca9715bdfcb4f8552bc2ada679c553d"))
  (:STATUS :OK :ENTRY
   (:PATH "method/integration-driver.lisp.txt" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-m1-integration.lisp")
    :BYTES 1032 :SHA256
    "a0fa6b06aa46f5fd041acdf2a5c7cec9d20dbe5fbdcfa16b3429520008d0a56c"))
  (:STATUS :OK :ENTRY
   (:PATH "method/contract.md.txt" :SOURCE
    #A((107) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/docs/implementazione/backup-offline-m1.md")
    :BYTES 11887 :SHA256
    "bde8666b279f6b81d77c375c366dc21d8e5d98facccf1f5ff79a782ee51b2ab3"))
  (:STATUS :OK :ENTRY
   (:PATH "pre-fix/copy.lisp.txt" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/pre-fix/copy.lisp.txt")
    :BYTES 7511 :SHA256
    "7ed027b50862528785a09d27fcacc581e7991c7fe22b64498b70fac5498c998a"))
  (:STATUS :OK :ENTRY
   (:PATH "pre-fix/operations.lisp.txt" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/pre-fix/operations.lisp.txt")
    :BYTES 3346 :SHA256
    "62b56bbb81244b7ff2d73c17de46240789df78b889eeadd9aa10d047449cd059"))
  (:STATUS :OK :ENTRY
   (:PATH "pre-fix/audit.lisp" :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/pre-fix/audit.lisp")
    :BYTES 743 :SHA256
    "71778df8ddee2f18f4b4650b27dfd50b0d75692bf359b9973494a05dcd1ac8ff"))
  (:STATUS :OK :ENTRY
   (:PATH "method/baseline-proof-helper.lisp.txt" :SOURCE
    #A((46) BASE-CHAR . "/private/tmp/arcdocdb-backup-prefix-proof.lisp")
    :BYTES 3634 :SHA256
    "aca775659a273cebf8b0d10689bb920fc152ac9e04a88b3c883057e59ecb2ca2"))
  (:STATUS :OK :ENTRY
   (:PATH "method/archive-helper.lisp.txt" :SOURCE
    #A((41) BASE-CHAR . "/private/tmp/arcdocdb-backup-archive.lisp") :BYTES
    3135 :SHA256
    "b890484d957deb9e9349a7e8e1591cfa31f6874c9fd35c76cc935579ba4bbad2"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection-manifest.lisp")
    :BYTES 17867 :SHA256
    "aa6f092405df43e92be8944e5e911240375fe636b3c549b60d05a8c274ae5d98"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((16) BASE-CHAR . "foundation-build") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/foundation-build/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((26) BASE-CHAR . "spikes/backup-m1-load.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((19) BASE-CHAR . "first-product-build") :RECORD-PATH
   #A((41) BASE-CHAR . "processes/first-product-build/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((26) BASE-CHAR . "spikes/backup-m1-load.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "product-build-2") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/product-build-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((26) BASE-CHAR . "spikes/backup-m1-load.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-1") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-1/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "lint-1") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/lint-1/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "lint")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "cli-selftest-1") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/cli-selftest-1/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((26) BASE-CHAR . "tools/arcdocdb-backup.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-2") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-3") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-3/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-4") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-4/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-5") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-5/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-6") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-6/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-7") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-7/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "reader-audit-1") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/reader-audit-1/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((28) BASE-CHAR . "spikes/backup-m1-reader.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "reader-audit-2") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/reader-audit-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((28) BASE-CHAR . "spikes/backup-m1-reader.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "focused-8") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/focused-8/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((28) BASE-CHAR . "late-corruption-reproduction") :RECORD-PATH
   #A((50) BASE-CHAR . "processes/late-corruption-reproduction/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "spikes/backup-m1-late-corruption.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((30) BASE-CHAR . "late-corruption-reproduction-2") :RECORD-PATH
   #A((52) BASE-CHAR . "processes/late-corruption-reproduction-2/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "spikes/backup-m1-late-corruption.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "focused-final") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/focused-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "spikes/backup-m1-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "full-check") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/full-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "docs-build") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/docs-build/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "docs-runtime") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((18) BASE-CHAR . "docs-runtime-check")
    #A((13) BASE-CHAR . "docs-examples"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "integration") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/integration/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((33) BASE-CHAR . "spikes/backup-m1-integration.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "integrated-docs") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/integrated-docs/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((23) BASE-CHAR . "integrated-docs-runtime") :RECORD-PATH
   #A((45) BASE-CHAR . "processes/integrated-docs-runtime/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((18) BASE-CHAR . "docs-runtime-check")
    #A((13) BASE-CHAR . "docs-examples"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check-ci-child" :RECORD-PATH
   "processes/full-check-ci-child/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793539008-21075"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 66 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((120) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-offline-backup-m1-originals/")
 :OBSERVATIONS
 #A((120) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-m1-20261101/collection-observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
