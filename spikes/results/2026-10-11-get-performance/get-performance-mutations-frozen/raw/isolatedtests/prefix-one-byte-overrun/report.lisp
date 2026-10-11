(:NAME "prefix-one-byte-overrun" :FILE "src/get/target.lisp" :DIRECTORY
 #A((148) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/prefix-one-byte-overrun/")
 :SUBSTITUTION
 (:BEFORE
  "(<= +segment-header-bytes+ offset (+ offset size) valid-bytes +segment-max-bytes+)"
  :AFTER
  "(<= +segment-header-bytes+ offset (+ offset size) (1+ valid-bytes) +segment-max-bytes+)")
 :EXPECTED-FAILURE :COMMITTED-PREFIX-OVERRUN-ACCEPTED :EXPECTED-TESTS
 ("TEST-REQ-AFF-002-PERFORMANCE-PREFIX-BOUNDARY") :STATUS :OK :RESULT :DETECTED
 :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "124214b934e8b997c8d77deebbf6261c") :COMPILED-TARGET
 (:FILE "src/get/target.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "124214b934e8b997c8d77deebbf6261c") :FASL
  #A((172) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/prefix-one-byte-overrun/fasl/src/get/target.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "97403afdfc21672c201f8546a952c0a1"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp"
   "TEST-REQ-AFF-002-PERFORMANCE-PREFIX-BOUNDARY")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((158) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/prefix-one-byte-overrun/stdout.log")
  :STDERR-LOG
  #A((158) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/prefix-one-byte-overrun/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/target.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "124214b934e8b997c8d77deebbf6261c") :FASL
    #A((172) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/prefix-one-byte-overrun/fasl/src/get/target.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "97403afdfc21672c201f8546a952c0a1"))
   :FAILED-TEST "TEST-REQ-AFF-002-PERFORMANCE-PREFIX-BOUNDARY" :PASSED-TESTS
   NIL :FAILURE-KIND :ASSERTION :CONDITION-TYPE
   #A((12) BASE-CHAR . "SIMPLE-ERROR") :DIAGNOSTIC
   #A((1427) BASE-CHAR . "Asserzione fallita: (HANDLER-CASE
                     (PROGN
                      (ECASE ARCDOCDB.GET.PERFORMANCE.TESTS::OPERATION
                        (:PROBE
                         (ARCDOCDB.GET:SONDA-CACHE-GET
                          ARCDOCDB.GET.PERFORMANCE.TESTS::CONTEXT
                          (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-SEGMENT
                           ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                          (1-
                           (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-VALID-BYTES
                            ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE))
                          0))
                        (:READ
                         (ARCDOCDB.GET:LEGGI-RECORD-GET
                          ARCDOCDB.GET.PERFORMANCE.TESTS::CONTEXT
                          (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-SEGMENT
                           ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                          (1-
                           (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-VALID-BYTES
                            ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE))
                          0)))
                      NIL)
                     (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
                      (EQ (ARCDOCDB.CONDITIONS:ERROR-REASON CONDITION)
                          :GET-SOURCE-LOCATION)))"))))
