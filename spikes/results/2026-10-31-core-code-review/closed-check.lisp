(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-core-code-review-originals/"
 :INDEXED-FILES 14 :ACTUAL-FILES 16 :INDEXED-BYTES 1511109 :PROCESSES
 ((:LABEL "initial" :RECORD-PATH "processes/initial/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-31-core-code-review/verify.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-sample" :RECORD-PATH "processes/process-sample/report.lisp"
   :COMMAND
   ("/usr/bin/sample" "23633" "1" "10" "-file"
    "/tmp/arcdocdb-core-review-stacks.txt")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "qualified" :RECORD-PATH "processes/qualified/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "spikes/core-code-review.lisp")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "a03275deb031da0c16702eacde85d1ad379de65a7acdfd3750ad5f34f7e37a39"
 :CATALOGUE-SHA256
 "6cd3e9a1ab325eb997a2a91e54ed81654ebc31785c987d63754f9fe29a4e25ac"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
