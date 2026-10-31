(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review-originals/"
 :INDEXED-FILES 55 :ACTUAL-FILES 57 :INDEXED-BYTES 7850413 :PROCESSES
 ((:LABEL "check-notices" :RECORD-PATH "processes/check-notices/report.lisp"
   :COMMAND ("make" "legal-check") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "unicode-check" :RECORD-PATH "processes/unicode-check/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
    "src/fulltext/unicode-tables.lisp")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-setup" :RECORD-PATH "processes/docs-setup/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/pages/bootstrap.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check-notices-final" :RECORD-PATH
   "processes/check-notices-final/report.lisp" :COMMAND ("make" "legal-check")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "unicode-check-final" :RECORD-PATH
   "processes/unicode-check-final/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
    "src/fulltext/unicode-tables.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-check" :RECORD-PATH "processes/docs-check/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "notices-qualified" :RECORD-PATH
   "processes/notices-qualified/report.lisp" :COMMAND ("make" "legal-check")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-qualified" :RECORD-PATH "processes/docs-qualified/report.lisp"
   :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "package" :RECORD-PATH "processes/package/report.lisp" :COMMAND
   ("make" "legal-notices") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "security-reporting" :RECORD-PATH
   "processes/security-reporting/report.lisp" :COMMAND
   ("gh" "api" "repos/gipidevdor/ArcDocDB/private-vulnerability-reporting")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "artifact-check" :RECORD-PATH "processes/artifact-check/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/legal-notices.lisp" "--check-artifact" "_build/legal-notices/")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-trace.lisp" "--write")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/lint.lisp" "src")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-trace.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "links" :RECORD-PATH "processes/links/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-links.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "notices-complete" :RECORD-PATH
   "processes/notices-complete/report.lisp" :COMMAND ("make" "legal-check")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "docs-complete" :RECORD-PATH "processes/docs-complete/report.lisp"
   :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "package-complete" :RECORD-PATH
   "processes/package-complete/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/legal-notices.lisp" "--stage-new" "_build/legal-notices-complete/")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "unicode-complete" :RECORD-PATH
   "processes/unicode-complete/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
    "src/fulltext/unicode-tables.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "artifact-complete" :RECORD-PATH
   "processes/artifact-complete/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/legal-notices.lisp" "--check-artifact"
    "_build/legal-notices-complete/")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "lint-complete" :RECORD-PATH "processes/lint-complete/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/lint.lisp" "src")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-complete" :RECORD-PATH "processes/trace-complete/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-trace.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "links-complete" :RECORD-PATH "processes/links-complete/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-links.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "a478e92ac30b0c2733e8f980ca15d02fb87562bd1dcab80b2539e8342a725506"
 :CATALOGUE-SHA256
 "855692f41530aad6d8f37a2eaa382fa9c5ffd2e3fca0be7b18f2d4a7337f50c9"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
