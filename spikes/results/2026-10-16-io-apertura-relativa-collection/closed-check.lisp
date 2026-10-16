(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/results/2026-10-16-io-apertura-relativa/"
 :INDEXED-FILES 61 :ACTUAL-FILES 63 :INDEXED-BYTES 2382779 :PROCESSES
 ((:LABEL "r1-outer" :RECORD-PATH "processes/r1-outer/report.lisp" :COMMAND
   ("env"
    "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-R1-fasl/**/*.*\") :ignore-inherited-configuration)"
    "make" "check")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-inner" :RECORD-PATH "processes/r1-inner/report.lisp" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND ("make" "trace-write") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE)
  (:LABEL "integration-check" :RECORD-PATH
   "processes/integration-check/report.lisp" :COMMAND
   ("make" "lint" "trace" "links") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
   :STABLE))
 :INDEX-SHA256
 "142dc0956a8bc0dee66801acd36a7ca88044d88e27471704b0c5da395ae4bd06"
 :CATALOGUE-SHA256
 "b613e530d1aa29d2c14d38de094a113f8cb9e69969d37a91960fce103d58b440"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
