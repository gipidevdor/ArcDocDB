(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci-originals/"
 :INDEXED-FILES 17 :ACTUAL-FILES 19 :INDEXED-BYTES 710471 :PROCESSES
 ((:LABEL "linux-ci-failed" :RECORD-PATH
   "processes/linux-ci-failed/report.lisp" :COMMAND ("make" "check-core")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-after-fixture-fix" :RECORD-PATH
   "processes/trace-after-fixture-fix/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-trace.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "links-after-fixture-fix" :RECORD-PATH
   "processes/links-after-fixture-fix/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-links.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "988518305013f5011aa59eeab21ad1cfdd95647bd91cc61e6090ddf9b8ccd5e9"
 :CATALOGUE-SHA256
 "e3a12b9b87994874187a04f1128e4ba16125b8d93c70467e2aac76f71541963a"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
