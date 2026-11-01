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
  (:LABEL "cli-selftest-1" :RECORD-PATH "processes/cli-selftest-1/report.lisp"
   :COMMAND
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
  (:LABEL "reader-audit-1" :RECORD-PATH "processes/reader-audit-1/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "spikes/backup-m1-reader.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "reader-audit-2" :RECORD-PATH "processes/reader-audit-2/report.lisp"
   :COMMAND
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
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-build" :RECORD-PATH "processes/docs-build/report.lisp" :COMMAND
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
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
