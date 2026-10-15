(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/archive/"
 :INDEXED-FILES 9 :ACTUAL-FILES 11 :INDEXED-BYTES 34276 :PROCESSES
 ((:LABEL "process-0" :RECORD-PATH "processes/0/report.lisp" :COMMAND
   ("fixture" "ok" "literal argument") :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-1" :RECORD-PATH "processes/1/report.lisp" :COMMAND
   ("fixture" "failed" "literal argument") :STATUS :FAILED :EXIT-CODE NIL
   :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-2" :RECORD-PATH "processes/2/report.lisp" :COMMAND
   ("fixture" "changed" "literal argument") :STATUS :SOURCE-CHANGED :EXIT-CODE
   0 :SOURCE-CONSISTENCY :CHANGED)
  (:LABEL "gzip-failed" :RECORD-PATH "processes/gzip/report.lisp" :COMMAND
   ("fixture" "compressed-failed" "literal argument") :STATUS :FAILED
   :EXIT-CODE 7 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "9eaf906a58700747afa3df1c7825311f830febe96074734572f96046b6bf4f50"
 :CATALOGUE-SHA256
 "f6527083ffdb5487230058ce974563e3fc8dceda6b84300832cb13dcfd0367c4"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
