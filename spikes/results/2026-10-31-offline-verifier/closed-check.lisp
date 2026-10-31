(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-offline-verifier-originals/"
 :INDEXED-FILES 38 :ACTUAL-FILES 40 :INDEXED-BYTES 4795979 :PROCESSES
 ((:LABEL "initial" :RECORD-PATH "processes/initial/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-2" :RECORD-PATH "processes/focused-2/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-3" :RECORD-PATH "processes/focused-3/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-4" :RECORD-PATH "processes/focused-4/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
   ("make" "lint") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "focused-5" :RECORD-PATH "processes/focused-5/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "report-isolation-failure" :RECORD-PATH
   "processes/report-isolation-failure/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "report-isolation-reproduction" :RECORD-PATH
   "processes/report-isolation-reproduction/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/verify-m1-check.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check-final" :RECORD-PATH
   "processes/full-check-final/report.lisp" :COMMAND ("make" "check-core")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs" :RECORD-PATH "processes/docs/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-runtime" :RECORD-PATH "processes/docs-runtime/report.lisp"
   :COMMAND ("make" "docs-runtime-check" "docs-examples") :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-catalog-follow-up" :RECORD-PATH
   "processes/ci-catalog-follow-up/report.lisp" :COMMAND ("make" "ci-selftest")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "ci-initial-child" :RECORD-PATH
   "processes/ci-initial-child/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/ci.lisp" "self-test" "--out"
    "spikes/out/ci/selftest-1793485167-19521")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "e55d9230088585581b5d38b5b394b2f5f7c324f4afcc3c3ebd20394f40549f03"
 :CATALOGUE-SHA256
 "b3ab0488bff38b401c6264d28ccbfde130fbeb6b7b6dba6d048e04caecd42cd3"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
