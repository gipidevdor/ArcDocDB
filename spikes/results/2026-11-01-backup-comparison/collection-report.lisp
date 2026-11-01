(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((141) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection-observations/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-backup-comparison-originals/"
   :INDEXED-FILES 79 :ACTUAL-FILES 81 :INDEXED-BYTES 9555377 :PROCESSES
   ((:LABEL "driver-self-test" :RECORD-PATH
     "processes/driver-self-test/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp"
      "--self-test")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "driver-self-test-2" :RECORD-PATH
     "processes/driver-self-test-2/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp"
      "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "baseline" :RECORD-PATH "processes/baseline/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/baseline-metrics.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "product-self-test" :RECORD-PATH
     "processes/product-self-test/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp"
      "--self-test")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "product-self-test-2" :RECORD-PATH
     "processes/product-self-test-2/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp"
      "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "analyzer-self-test" :RECORD-PATH
     "processes/analyzer-self-test/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "optimized" :RECORD-PATH "processes/optimized/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/optimized-metrics.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "analysis" :RECORD-PATH "processes/analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/optimized-metrics.lisp"
      "spikes/out/backup-compare-20261101/optimized-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "analyzer-self-test-2" :RECORD-PATH
     "processes/analyzer-self-test-2/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "repeat" :RECORD-PATH "processes/repeat/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/repeat-metrics.lisp" "--reverse")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "repeat-analysis" :RECORD-PATH
     "processes/repeat-analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/repeat-metrics.lisp"
      "spikes/out/backup-compare-20261101/repeat-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "baseline-analysis" :RECORD-PATH
     "processes/baseline-analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/baseline-metrics.lisp"
      "spikes/out/backup-compare-20261101/baseline-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "equalp-self-test" :RECORD-PATH
     "processes/equalp-self-test/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp"
      "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "equalp" :RECORD-PATH "processes/equalp/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/equalp-metrics.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "equalp-analysis" :RECORD-PATH
     "processes/equalp-analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/equalp-metrics.lisp"
      "spikes/out/backup-compare-20261101/equalp-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "equalp-repeat" :RECORD-PATH "processes/equalp-repeat/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/equalp-repeat-metrics.lisp"
      "--reverse")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "equalp-repeat-analysis" :RECORD-PATH
     "processes/equalp-repeat-analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/equalp-repeat-metrics.lisp"
      "spikes/out/backup-compare-20261101/equalp-repeat-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "final-benchmark" :RECORD-PATH
     "processes/final-benchmark/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
      "spikes/out/backup-compare-20261101/final-metrics.lisp" "--reverse")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "qualification" :RECORD-PATH "processes/qualification/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/backup-compare-check.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs" :RECORD-PATH "processes/docs/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "final-analysis" :RECORD-PATH
     "processes/final-analysis/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/backup-compare-analyze.lisp" "--analyze"
      "spikes/out/backup-compare-20261101/final-metrics.lisp"
      "spikes/out/backup-compare-20261101/final-analysis.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-runtime" :RECORD-PATH "processes/docs-runtime/report.lisp"
     :COMMAND ("make" "docs-runtime-check" "docs-examples") :STATUS :OK
     :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "ci-selftest" :RECORD-PATH "processes/ci-selftest/report.lisp"
     :COMMAND ("make" "ci-selftest") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "prior-audit-c4" :RECORD-PATH
     "processes/prior-audit-c4/report.lisp" :COMMAND ("make" "ci-audit")
     :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "current-ci-child" :RECORD-PATH
     "processes/current-ci-child/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out"
      "spikes/out/ci/selftest-1793545072-96779")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "47b3a32f51f3dee054e69d1da75e411a8af1d4ce332a46fb67beb1e2eb0e7eab"
   :CATALOGUE-SHA256
   "3ef726c27fafb4874c90341d93303b0406999b419673340024fae8db3b0d56bd"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (26 1 26 26) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/driver-self-test/report.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/driver-self-test/report.lisp")
    :BYTES 357377 :SHA256
    "99e08fc17c9b64fc587920f90273044b52b6aef884959531d78bda803467dfb5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/driver-self-test/conservazione.lisp")
    :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/driver-self-test/conservazione.lisp")
    :BYTES 1175 :SHA256
    "db78c4aebd08370175e72c6297956fed85b1db9e617a856086b22dd4eaf21a9d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/driver-self-test-2/report.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/driver-self-test-2/report.lisp")
    :BYTES 354369 :SHA256
    "6f48b70a929212ef0cd1709eed0ea3602c3ab8f901bb11ff4405272115011e26"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((47) BASE-CHAR . "processes/driver-self-test-2/conservazione.lisp")
    :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/driver-self-test-2/conservazione.lisp")
    :BYTES 1179 :SHA256
    "e3d5e10f5857795df3351b220ee1cb901bab43b875f9785552051699c227bf4a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((30) BASE-CHAR . "processes/baseline/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline/report.lisp")
    :BYTES 354470 :SHA256
    "4d4633b304b6793356c78226681f0d7bb36fb8b15a08ebd44ef2795ef67f99ec"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/baseline/conservazione.lisp") :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline/conservazione.lisp")
    :BYTES 1159 :SHA256
    "22e5665b7ee6f9e63ca6d837012359b252fdf426094561e65903d4a9225f42bb"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/product-self-test/report.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/product-self-test/report.lisp")
    :BYTES 362053 :SHA256
    "ad11f3d0344cee95ab8e1023a94b024947f97e1d4ce010e3565d3e7aac6f2eb3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/product-self-test/conservazione.lisp")
    :SOURCE
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/product-self-test/conservazione.lisp")
    :BYTES 1177 :SHA256
    "6cb7ecb1c62191e84db266ba21a8f91596e3444c31ed2367aa054dcb64b2c46b"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/product-self-test-2/report.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/product-self-test-2/report.lisp")
    :BYTES 354667 :SHA256
    "bac7e616be0a2935c3ebd5729d0118ddf3f81b4184aa292e83bca5e25cb2b54b"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/product-self-test-2/conservazione.lisp")
    :SOURCE
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/product-self-test-2/conservazione.lisp")
    :BYTES 1181 :SHA256
    "b53977b59bac0d9fb74e42b215bea4e75fb95ada0fa77382a7cc3dcdddcc5213"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/analyzer-self-test/report.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analyzer-self-test/report.lisp")
    :BYTES 354454 :SHA256
    "1249f220993f56931e42977fc2d683b63778041522159adfd0f548667f946455"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((47) BASE-CHAR . "processes/analyzer-self-test/conservazione.lisp")
    :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analyzer-self-test/conservazione.lisp")
    :BYTES 1179 :SHA256
    "3e3d7e3bba23bbed78a673a33f69ade1a3ee587578e0ee77283343db0b79a666"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "processes/optimized/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/optimized/report.lisp")
    :BYTES 354769 :SHA256
    "ea5d949f7059ae92beb222e01e56ea98aab1a78651aeb931bebdd889601f2d61"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/optimized/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/optimized/conservazione.lisp")
    :BYTES 1161 :SHA256
    "818956cf05797c0f20dab696df90a9aa3563e0769910414519553cb77d4f6e21"))
  (:STATUS :OK :ENTRY
   (:PATH #A((30) BASE-CHAR . "processes/analysis/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analysis/report.lisp")
    :BYTES 355790 :SHA256
    "feafb15972253d29635c270abe1889be2ec88d21bd7ab692ba45407a63ede0e1"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/analysis/conservazione.lisp") :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analysis/conservazione.lisp")
    :BYTES 1159 :SHA256
    "05764bd78840282d1e154c76c53879252887facfdbdd96e77e3aa3b86a3dd741"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/analyzer-self-test-2/report.lisp")
    :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analyzer-self-test-2/report.lisp")
    :BYTES 354455 :SHA256
    "c99893daa706e0e54b9cf97049ab95913230feedc72e68b625b7e2a4979a8969"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((49) BASE-CHAR . "processes/analyzer-self-test-2/conservazione.lisp")
    :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/analyzer-self-test-2/conservazione.lisp")
    :BYTES 1183 :SHA256
    "7708ecff495e0b67386e0f4e0c5daa4d8fcd82acad3460917779ab91a7eb09c9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((28) BASE-CHAR . "processes/repeat/report.lisp") :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat/report.lisp")
    :BYTES 354792 :SHA256
    "d02ee9385d0b3594cdd9827722b51adcff4b16a8811604ed0605b3e95376d4c7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/repeat/conservazione.lisp") :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat/conservazione.lisp")
    :BYTES 1155 :SHA256
    "57b0b0f1d25a4482461b38026c3c2e3ac68a9f1c56dcb2137864de3e4da13007"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/repeat-analysis/report.lisp") :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat-analysis/report.lisp")
    :BYTES 355787 :SHA256
    "a8acf35b0be2baac511ee11ff6fda209a58fe1fd951bdb80352d08b216234b4f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/repeat-analysis/conservazione.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat-analysis/conservazione.lisp")
    :BYTES 1173 :SHA256
    "05a914c9a594fb669248ac374ba7821a1043e49b5aa6694e2c215d57cdaebb7f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/baseline-analysis/report.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline-analysis/report.lisp")
    :BYTES 355795 :SHA256
    "49916283d33ce883de622b958d2a8f77c021ba06714e536dd5055b4a7cf8ea9e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/baseline-analysis/conservazione.lisp")
    :SOURCE
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline-analysis/conservazione.lisp")
    :BYTES 1177 :SHA256
    "dc89b9de1f058843785cc4d36ff4773f4c2a5447b7f5a52630b767929c916f00"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/equalp-self-test/report.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-self-test/report.lisp")
    :BYTES 354667 :SHA256
    "ba35597da1f078b8e313bbd1cbdc99101e4da899edf11d876dd40a01bf682e54"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/equalp-self-test/conservazione.lisp")
    :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-self-test/conservazione.lisp")
    :BYTES 1175 :SHA256
    "fceb6490afb1a22809a8f8754c8bbcf44b96382f933d0aeb764ce3772887aebf"))
  (:STATUS :OK :ENTRY
   (:PATH #A((28) BASE-CHAR . "processes/equalp/report.lisp") :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp/report.lisp")
    :BYTES 354763 :SHA256
    "4341c09415fc438420e367090e8665f971069163b3b5d6af3330e311f7bae715"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/equalp/conservazione.lisp") :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp/conservazione.lisp")
    :BYTES 1155 :SHA256
    "8b7e91892d7f0af34bff111995b87ffd8c3a03d1b78668bb314c51849d8512dc"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/equalp-analysis/report.lisp") :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-analysis/report.lisp")
    :BYTES 355811 :SHA256
    "38283257a41920b95670d78c1264a85169105c7efca2e43fa0525dafd9c80a46"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/equalp-analysis/conservazione.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-analysis/conservazione.lisp")
    :BYTES 1173 :SHA256
    "7c268820b381e61598f350b706e152fa44281621c87036c46372d4bf9dfc1baf"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/equalp-repeat/report.lisp") :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat/report.lisp")
    :BYTES 354811 :SHA256
    "15294e0b59a7196fe7776a273ef3e2c2b67488660d1579fcf3bce24e6309d502"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/equalp-repeat/conservazione.lisp")
    :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat/conservazione.lisp")
    :BYTES 1169 :SHA256
    "e825f32a39b7278eb039aafd82f0dff4d4c5181ab8dabd9edaedecbfec532632"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/equalp-repeat-analysis/report.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat-analysis/report.lisp")
    :BYTES 355809 :SHA256
    "d04363e283104f08170d669a96040061c00113ee4b17cb6600f4a7d5008e9f46"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((51) BASE-CHAR . "processes/equalp-repeat-analysis/conservazione.lisp")
    :SOURCE
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat-analysis/conservazione.lisp")
    :BYTES 1187 :SHA256
    "0bb7a53561e50b36372fd0dc69389519cf24903f0f3c5cff9eaa9154daa63a37"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/final-benchmark/report.lisp") :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-benchmark/report.lisp")
    :BYTES 354849 :SHA256
    "b4c9c34dbcaff9f9f5e3b3418592b4b989e6ebee5ad5e8a31ebb0671b9fe250b"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/final-benchmark/conservazione.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-benchmark/conservazione.lisp")
    :BYTES 1173 :SHA256
    "20b673c9c0a5787d5f56deb51fc63e3bbc01b5e8627b2026375f3a418dad163f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/qualification/report.lisp") :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/qualification/report.lisp")
    :BYTES 363544 :SHA256
    "6a83336d38d228f88c36e9e43b72e23c879a01e8aa4bb069973a9228ae4f4ead"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/qualification/conservazione.lisp")
    :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/qualification/conservazione.lisp")
    :BYTES 1169 :SHA256
    "8974d8b4c2e5fe1107fdf7f8f1c18ddc1d21f5aa9bc6226cb7304c2ff60c95de"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "processes/docs/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/docs/report.lisp")
    :BYTES 357114 :SHA256
    "5eef48a9fab9b0d3264deba1e39e29d15d115d62c7e60f168ff57d69e0620c88"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/docs/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/docs/conservazione.lisp")
    :BYTES 1151 :SHA256
    "c0f6c15b9472a829b805a298cdf3bc9ba2487d98457589e5cc08232bd69601cf"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/final-analysis/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-analysis/report.lisp")
    :BYTES 356074 :SHA256
    "93d30970965e1dc0283ecaa91bd5ac2db5dd8767b0f597415cc207a5b05c0952"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/final-analysis/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-analysis/conservazione.lisp")
    :BYTES 1171 :SHA256
    "c8189ff78c896c706d194bb6b833142dcf1d529a528b6effa7b7a627025a45de"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/docs-runtime/report.lisp")
    :BYTES 354959 :SHA256
    "80b8c5b94eeec903315cf2bc695ab706cb851d108aa44bb0758e494dcb08e94b"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/docs-runtime/conservazione.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/docs-runtime/conservazione.lisp")
    :BYTES 1167 :SHA256
    "5bcdc6aeb44612b7e3b80fad9662396078d63ca63bc6a5457e754c3cf6bc9a02"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/ci-selftest/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/ci-selftest/report.lisp")
    :BYTES 354965 :SHA256
    "b32f787f3cdc1a10290a37379468f905fa7aa0074e84326abfa35afb919461fb"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/ci-selftest/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/ci-selftest/conservazione.lisp")
    :BYTES 1165 :SHA256
    "fef47ba4278e3c1bbcd5e0141f3c8145475485430ae10f6c8e0d1fcbcc0b9f5d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/prior-audit-c4/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/prior-audit-c4/report.lisp")
    :BYTES 311 :SHA256
    "c9350a7e485f981ddf8c6998a1a9d8db2573da855d1dbcf86fb969a24bf716f0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/prior-audit-c4/report.lisp.gz")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/prior-audit-c4/report.lisp.gz")
    :BYTES 124655 :SHA256
    "0bc8a4d18de0f1b734e88b0c9569d0b8a25baf3c8af82becbe2cb866b547fbd6"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/prior-audit-c4/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/prior-audit-c4/conservazione.lisp")
    :BYTES 1085 :SHA256
    "f62de6ec9e0967599832f27a946902fc0cd22b9af78e71d380c6c731e5ef9f67"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/current-ci-child/report.lisp" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002533872-command-96783-0/report.lisp")
    :BYTES 355458 :SHA256
    "ae9c22c4d1a3d22f1d0cf38bf7c0011ca63af07ab503bfe7e0cd50426fe5892a"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/current-ci-child/conservazione.lisp" :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/4002533872-command-96783-0/conservazione.lisp")
    :BYTES 1147 :SHA256
    "b189f306602211fefd4fb3efd0ef74251a36d1ef2de45ae36205d2601da9f8e5"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/baseline-metrics.lisp" :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline-metrics.lisp")
    :BYTES 11514 :SHA256
    "196283554b09eb050c369bb76e272661e92bbedf8ec80c611db18bd3344b5715"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/baseline-analysis.lisp" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline-analysis.lisp")
    :BYTES 1206 :SHA256
    "11225a5656006a73afbeb69e31ec676283ac778b812d957aa27ebf89c88aa826"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/optimized-metrics.lisp" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/optimized-metrics.lisp")
    :BYTES 11521 :SHA256
    "4b44fe1b4fa5b5f5fffb4585c860c37df81164dd4564890d7ca44f20656a6704"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/optimized-analysis.lisp" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/optimized-analysis.lisp")
    :BYTES 1197 :SHA256
    "ee12d7965b6a782b2f427098c33d87ff66af7d49f02c4fd87dc08ff14ea18e4d"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/repeat-metrics.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat-metrics.lisp")
    :BYTES 11510 :SHA256
    "04317b4d306abd38a70ad5e340a04a787ff163f09684408f2955f33b57dc029e"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/repeat-analysis.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/repeat-analysis.lisp")
    :BYTES 1205 :SHA256
    "67a8cfdd8f9ad4916fb07de615ac1d7884b9ba59494b98de9955ed07ba082cdf"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/equalp-metrics.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-metrics.lisp")
    :BYTES 11512 :SHA256
    "82be2d248b8fccc0ae2fef6917d2acb7113d0204db949501f2e1ae03ab8cab5c"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/equalp-analysis.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-analysis.lisp")
    :BYTES 1229 :SHA256
    "6fb2c43b9ae42eee3356f8ab0af54ab84fb6223990ce6f365d507042d1f6ab35"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/equalp-repeat-metrics.lisp" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat-metrics.lisp")
    :BYTES 11509 :SHA256
    "f3f6ca204999a5784350371206c9695fd5944971273fa976fa4fdedd33fe1a01"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/equalp-repeat-analysis.lisp" :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/equalp-repeat-analysis.lisp")
    :BYTES 1208 :SHA256
    "5a1c9c7bc2d7614c83fb2db2e7d28f100ee98653bf6662e373d5007b9ac2933a"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/final-metrics.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-metrics.lisp")
    :BYTES 11513 :SHA256
    "1d095b635d8d86e51ada8406c50ad600c95e23bd441110ad768e784032ff45eb"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/final-analysis.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/final-analysis.lisp")
    :BYTES 1197 :SHA256
    "524df80e07687083ae659a62a977c63b468893e7ad187a3b367648491ab5dc95"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/source-identity.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/source-identity.lisp")
    :BYTES 55444 :SHA256
    "292fd7bd611a292916a725b467af9b567b66229ca7d7557e313ae8926ec6c71b"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/baseline-copy.lisp.txt" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/baseline-copy.lisp.txt")
    :BYTES 7804 :SHA256
    "8d6e27463baf76a059241e7baaa28db9a245f494b5032269b3a33d46e3e49b40"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/driver-before-syntax-fix.lisp.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/driver-before-syntax-fix.lisp.txt")
    :BYTES 7513 :SHA256
    "2bd85295d6d0dd0f00f4ac6061ac05e190c116ad744117e172f05b0ad5006d76"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/copy-before-syntax-fix.lisp.txt" :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/copy-before-syntax-fix.lisp.txt")
    :BYTES 7878 :SHA256
    "35067aa1533da5fe73b7f4b84eec37ebcc7864cf73b563ecc750b1efd5573363"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/mismatch-copy.lisp.txt" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/mismatch-copy.lisp.txt")
    :BYTES 7877 :SHA256
    "332a19ff7ddbd0829b9116b0a3c7c5a4d1935a8e9a580c0426814458c7f851ec"))
  (:STATUS :OK :ENTRY
   (:PATH "observations/prior-audit.zip" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/prior-audit.zip")
    :BYTES 616281 :SHA256
    "2ae98c372f39dc90db41105ea9bb5f5fa8a805e422b30e5d48ce52052b6acc74"))
  (:STATUS :OK :ENTRY
   (:PATH "method/timing-driver.lisp.txt" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-compare-bench.lisp")
    :BYTES 8764 :SHA256
    "f76e54ea1eeb204dbeecce07bba14991892c1d5434bcbd0f76e28eee2d05ccc9"))
  (:STATUS :OK :ENTRY
   (:PATH "method/analysis-driver.lisp.txt" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-compare-analyze.lisp")
    :BYTES 5636 :SHA256
    "b92ef355fb41da95aed0f61814cdd1582cf665f6223dc143bf500d7ea1f2a7f8"))
  (:STATUS :OK :ENTRY
   (:PATH "method/qualification-driver.lisp.txt" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/backup-compare-check.lisp")
    :BYTES 702 :SHA256
    "3a3b9cd5b5267be741cab1235a0d5cc08a07fa4cbf2e89ae6484dc873184c9d5"))
  (:STATUS :OK :ENTRY
   (:PATH "method/registered-method.md.txt" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-backup-comparison/method.md")
    :BYTES 3019 :SHA256
    "68c1fe42eabe1e58c0ae63ed255f13bb0ff0ae137dabcc9c470cfa6f5ce6e365"))
  (:STATUS :OK :ENTRY
   (:PATH "diagnostics/current-ci-summary.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793545072-96779/report.lisp")
    :BYTES 632 :SHA256
    "3bf53e3748c34568e0fb83b9f6f7ed394be5c711a74ca8b7bdde88a45f49bc23"))
  (:STATUS :OK :ENTRY
   (:PATH "diagnostics/current-ci-tests.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/ci/selftest-1793545072-96779/tests.lisp")
    :BYTES 2409 :SHA256
    "bdb3551f75c4e5288f9f8d76215b6b9e9ea152294f70625962c2d0435664e950"))
  (:STATUS :OK :ENTRY
   (:PATH "method/source-binding-helper.lisp.txt" :SOURCE
    #A((43) BASE-CHAR . "/private/tmp/arcdocdb-compare-identity.lisp") :BYTES
    3731 :SHA256
    "6bc8c2da98f3edc5680d6ebb9a03cea948b27c9ba72ef80aab9e80c41264694b"))
  (:STATUS :OK :ENTRY
   (:PATH "method/archive-helper.lisp.txt" :SOURCE
    #A((42) BASE-CHAR . "/private/tmp/arcdocdb-compare-archive.lisp") :BYTES
    3290 :SHA256
    "be98d0d7ad7581b12a0a9961643e34953196454068734fe74a8ffbdc83663b8b"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection-manifest.lisp")
    :BYTES 21095 :SHA256
    "b4d54dac8e1d59be303f95a1e1457fb82c222b6faf2bf28249a7239460cb8c75"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((16) BASE-CHAR . "driver-self-test") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/driver-self-test/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((18) BASE-CHAR . "driver-self-test-2") :RECORD-PATH
   #A((40) BASE-CHAR . "processes/driver-self-test-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((8) BASE-CHAR . "baseline") :RECORD-PATH
   #A((30) BASE-CHAR . "processes/baseline/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((56) BASE-CHAR
       . "spikes/out/backup-compare-20261101/baseline-metrics.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "product-self-test") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/product-self-test/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((19) BASE-CHAR . "product-self-test-2") :RECORD-PATH
   #A((41) BASE-CHAR . "processes/product-self-test-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((18) BASE-CHAR . "analyzer-self-test") :RECORD-PATH
   #A((40) BASE-CHAR . "processes/analyzer-self-test/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((9) BASE-CHAR . "optimized") :RECORD-PATH
   #A((31) BASE-CHAR . "processes/optimized/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((57) BASE-CHAR
       . "spikes/out/backup-compare-20261101/optimized-metrics.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((8) BASE-CHAR . "analysis") :RECORD-PATH
   #A((30) BASE-CHAR . "processes/analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((57) BASE-CHAR
       . "spikes/out/backup-compare-20261101/optimized-metrics.lisp")
    #A((58) BASE-CHAR
       . "spikes/out/backup-compare-20261101/optimized-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((20) BASE-CHAR . "analyzer-self-test-2") :RECORD-PATH
   #A((42) BASE-CHAR . "processes/analyzer-self-test-2/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "repeat") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/repeat/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((54) BASE-CHAR
       . "spikes/out/backup-compare-20261101/repeat-metrics.lisp")
    #A((9) BASE-CHAR . "--reverse"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "repeat-analysis") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/repeat-analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((54) BASE-CHAR
       . "spikes/out/backup-compare-20261101/repeat-metrics.lisp")
    #A((55) BASE-CHAR
       . "spikes/out/backup-compare-20261101/repeat-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "baseline-analysis") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/baseline-analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((56) BASE-CHAR
       . "spikes/out/backup-compare-20261101/baseline-metrics.lisp")
    #A((57) BASE-CHAR
       . "spikes/out/backup-compare-20261101/baseline-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "equalp-self-test") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/equalp-self-test/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((6) BASE-CHAR . "equalp") :RECORD-PATH
   #A((28) BASE-CHAR . "processes/equalp/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((54) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-metrics.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "equalp-analysis") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/equalp-analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((54) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-metrics.lisp")
    #A((55) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "equalp-repeat") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/equalp-repeat/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((61) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-repeat-metrics.lisp")
    #A((9) BASE-CHAR . "--reverse"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((22) BASE-CHAR . "equalp-repeat-analysis") :RECORD-PATH
   #A((44) BASE-CHAR . "processes/equalp-repeat-analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((61) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-repeat-metrics.lisp")
    #A((62) BASE-CHAR
       . "spikes/out/backup-compare-20261101/equalp-repeat-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "final-benchmark") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/final-benchmark/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-bench.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((53) BASE-CHAR
       . "spikes/out/backup-compare-20261101/final-metrics.lisp")
    #A((9) BASE-CHAR . "--reverse"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "qualification") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/qualification/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "spikes/backup-compare-check.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "docs") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/docs/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "final-analysis") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/final-analysis/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/backup-compare-analyze.lisp")
    #A((9) BASE-CHAR . "--analyze")
    #A((53) BASE-CHAR
       . "spikes/out/backup-compare-20261101/final-metrics.lisp")
    #A((54) BASE-CHAR
       . "spikes/out/backup-compare-20261101/final-analysis.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "docs-runtime") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/docs-runtime/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((18) BASE-CHAR . "docs-runtime-check")
    #A((13) BASE-CHAR . "docs-examples"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "ci-selftest") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/ci-selftest/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "ci-selftest")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "prior-audit-c4") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/prior-audit-c4/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((8) BASE-CHAR . "ci-audit")) :STATUS :FAILED
   :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "current-ci-child" :RECORD-PATH
   "processes/current-ci-child/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((39) BASE-CHAR . "spikes/out/ci/selftest-1793545072-96779"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 79 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((120) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-backup-comparison-originals/")
 :OBSERVATIONS
 #A((125) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/backup-compare-20261101/collection-observations/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
