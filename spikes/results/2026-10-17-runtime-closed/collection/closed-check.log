(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed-originals/"
 :INDEXED-FILES 19 :ACTUAL-FILES 21 :INDEXED-BYTES 1792409 :PROCESSES
 ((:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/check-trace.lisp" "--write")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "compile" :RECORD-PATH "processes/compile/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "/tmp/arcdocdb-runtime-closed-compile.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/lint.lisp" "src")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/check-trace.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "links" :RECORD-PATH "processes/links/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/check-links.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "disassemble" :RECORD-PATH "processes/disassemble/report.lisp"
   :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "/tmp/arcdocdb-runtime-closed-disassemble.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "evidence" :RECORD-PATH "processes/evidence/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/check-evidence.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "87c5b28ae745383a39efd787af24eb1fd3b7ca809e45722262adf017a6e22870"
 :CATALOGUE-SHA256
 "90138c35b1470fcc53d3363ba1e9c277c6264ef6912d1c84a63ebcaf804ef7ea"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
