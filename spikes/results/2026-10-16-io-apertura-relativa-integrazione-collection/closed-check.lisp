(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
 "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/results/2026-10-16-io-apertura-relativa-integrazione/"
 :INDEXED-FILES 25 :ACTUAL-FILES 27 :INDEXED-BYTES 1220345 :PROCESSES
 ((:LABEL "r2" :RECORD-PATH "processes/r2/report.lisp" :COMMAND
   ("env"
    "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-R2-fasl/**/*.*\") :ignore-inherited-configuration)"
    "make" "test" "lint" "trace" "links")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "post-publication-p1" :RECORD-PATH
   "processes/post-publication-p1/report.lisp" :COMMAND
   ("make" "trace" "links" "evidence") :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-linux" :RECORD-PATH "processes/pr1-linux/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-documentation" :RECORD-PATH
   "processes/pr1-documentation/report.lisp" :COMMAND ("make" "trace" "links")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-macos" :RECORD-PATH "processes/pr1-macos/report.lisp" :COMMAND
   ("/Applications/Xcode_26.6.app/Contents/Developer/usr/bin/make"
    "check-core")
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :INDEX-SHA256
 "e47bec4c3b00258bf4116de21c1aff4e71c0836e0833d653b1a420e102f4378d"
 :CATALOGUE-SHA256
 "d55deb00a79a20f9428c7c72ba8ea1779c48958f21479e586a7ed2787375f920"
 :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
 :LIMITS
 (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
  :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED T
  :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
  :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL))
