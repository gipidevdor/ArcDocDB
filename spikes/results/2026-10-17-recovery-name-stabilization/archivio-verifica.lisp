(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization-originals/"
 :INDEXED-FILES 19 :ACTUAL-FILES 21 :INDEXED-BYTES 1943537 :PROCESSES
 ((:LABEL "compile" :RECORD-PATH "processes/compile/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "/tmp/arcdocdb-name-stabilization-compile.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "compile-final" :RECORD-PATH "processes/compile-final/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "/tmp/arcdocdb-name-stabilization-compile.lisp")
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
  (:LABEL "disassemble" :RECORD-PATH "processes/disassemble/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "/tmp/arcdocdb-name-stabilization-disassemble.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "edf0fbdc062a4bbeab3c6924de105ce3724e659c9089825aa9e31db0e4832889"
 :CATALOGUE-SHA256
 "699435f7e64661325d52cf154818075f891ba61fffe6f519c7c5701c535349d6"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
