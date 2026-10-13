(:SCHEMA-VERSION 1 :KIND :POOL-LIFECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-NEW-LIFECYCLE-PLUS-PACKAGE :NATIVE-PATH
 #A((130) BASE-CHAR
    . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/coverage-attempt-01/coverage-state.lisp")
 :HTML-PATH
 #A((127) BASE-CHAR
    . "/private/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/coverage-attempt-01/cover-index.html")
 :FILES
 ((:FILE #A((34) BASE-CHAR . "src/scheduler/lifecycle-build.lisp")
   :EXPRESSIONS-HIT 134 :EXPRESSIONS-TOTAL 135 :BRANCHES-HIT 20 :BRANCHES-TOTAL
   20 :MISSING ((:NATIVE-INDEX 36 :KIND :EXPRESSION :PATH (3 2 3))))
  (:FILE #A((33) BASE-CHAR . "src/scheduler/lifecycle-read.lisp")
   :EXPRESSIONS-HIT 108 :EXPRESSIONS-TOTAL 108 :BRANCHES-HIT 20 :BRANCHES-TOTAL
   20 :MISSING NIL)
  (:FILE #A((34) BASE-CHAR . "src/scheduler/lifecycle-types.lisp")
   :EXPRESSIONS-HIT 16 :EXPRESSIONS-TOTAL 16 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0
   :MISSING NIL)
  (:FILE #A((35) BASE-CHAR . "src/scheduler/lifecycle-update.lisp")
   :EXPRESSIONS-HIT 94 :EXPRESSIONS-TOTAL 94 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8
   :MISSING NIL)
  (:FILE #A((35) BASE-CHAR . "src/scheduler/lifecycle-worker.lisp")
   :EXPRESSIONS-HIT 61 :EXPRESSIONS-TOTAL 61 :BRANCHES-HIT 12 :BRANCHES-TOTAL
   12 :MISSING NIL)
  (:FILE #A((26) BASE-CHAR . "src/scheduler/package.lisp") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL))
 :LIFECYCLE-TOTAL (414 415 60 60) :MINIMUM-PERCENT 95 :HTML-COUNTS
 (("src/scheduler/lifecycle-build.lisp" 134 135 20 20)
  ("src/scheduler/lifecycle-read.lisp" 108 108 20 20)
  ("src/scheduler/lifecycle-types.lisp" 16 16 0 0)
  ("src/scheduler/lifecycle-update.lisp" 94 94 8 8)
  ("src/scheduler/lifecycle-worker.lisp" 61 61 12 12)
  ("src/scheduler/package.lisp" 1 1 0 0))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
