(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-11-01-backup-comparison-originals/"
 :INDEXED-FILES 79 :ACTUAL-FILES 81 :INDEXED-BYTES 9555377 :PROCESSES
 ((:LABEL "driver-self-test" :RECORD-PATH
   "processes/driver-self-test/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--self-test")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "driver-self-test-2" :RECORD-PATH
   "processes/driver-self-test-2/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--self-test")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "baseline" :RECORD-PATH "processes/baseline/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--run"
    "spikes/out/backup-compare-20261101/baseline-metrics.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "product-self-test" :RECORD-PATH
   "processes/product-self-test/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--self-test")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "product-self-test-2" :RECORD-PATH
   "processes/product-self-test-2/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--self-test")
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
    "--no-sysinit" "--script" "spikes/backup-compare-bench.lisp" "--self-test")
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
  (:LABEL "final-analysis" :RECORD-PATH "processes/final-analysis/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "spikes/backup-compare-analyze.lisp" "--analyze"
    "spikes/out/backup-compare-20261101/final-metrics.lisp"
    "spikes/out/backup-compare-20261101/final-analysis.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-runtime" :RECORD-PATH "processes/docs-runtime/report.lisp"
   :COMMAND ("make" "docs-runtime-check" "docs-examples") :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-selftest" :RECORD-PATH "processes/ci-selftest/report.lisp"
   :COMMAND ("make" "ci-selftest") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "prior-audit-c4" :RECORD-PATH "processes/prior-audit-c4/report.lisp"
   :COMMAND ("make" "ci-audit") :STATUS :FAILED :EXIT-CODE 2
   :SOURCE-CONSISTENCY :STABLE)
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
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
