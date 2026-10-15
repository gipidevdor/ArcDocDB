(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/results/2026-10-15-serie-inventory/"
 :INDEXED-FILES 76 :ACTUAL-FILES 78 :INDEXED-BYTES 3607891 :PROCESSES
 ((:LABEL "r1-outer" :RECORD-PATH "processes/r1-outer/report.lisp" :COMMAND
   ("env"
    "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R1-fasl/**/*.*\") :ignore-inherited-configuration)"
    "make" "check")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-inner" :RECORD-PATH "processes/r1-inner/report.lisp" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r2-outer" :RECORD-PATH "processes/r2-outer/report.lisp" :COMMAND
   ("env"
    "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R2-fasl/**/*.*\") :ignore-inherited-configuration)"
    "make" "check")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r2-inner" :RECORD-PATH "processes/r2-inner/report.lisp" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r3-outer" :RECORD-PATH "processes/r3-outer/report.lisp" :COMMAND
   ("env"
    "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R3-fasl/**/*.*\") :ignore-inherited-configuration)"
    "make" "check")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r3-inner" :RECORD-PATH "processes/r3-inner/report.lisp" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "counter" :RECORD-PATH "processes/counter/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--disable-debugger" "--script"
    "spikes/out/serie-inventory-count-tools/count-tests.lisp" "--workspace"
    "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB" "--commit"
    "88a8cdd77027bfebdbab01c47ce3d4dfbbedec85")
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND ("make" "trace-write") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "integration-check" :RECORD-PATH
   "processes/integration-check/report.lisp" :COMMAND
   ("make" "lint" "trace" "links") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE))
 :INDEX-SHA256
 "bf0d25ba77661126e850a01cc692a6d21a18af87a65ddfc688dce1efa1576b51"
 :CATALOGUE-SHA256
 "272d02018945bf146a75eabd30e51d2b128ec1aedbf90c05e8c080e79ee740a8"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
