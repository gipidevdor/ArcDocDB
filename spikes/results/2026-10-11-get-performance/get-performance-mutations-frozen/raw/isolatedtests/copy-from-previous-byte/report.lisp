(:NAME "copy-from-previous-byte" :FILE "src/get/lifecycle.lisp" :DIRECTORY
 #A((148) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/copy-from-previous-byte/")
 :SUBSTITUTION
 (:BEFORE
  "(replace destination bytes :start1 start :end1 end :start2 vs :end2 ve)"
  :AFTER
  "(replace destination bytes :start1 start :end1 end :start2 (1- vs) :end2 (1- ve))")
 :EXPECTED-FAILURE :OUTPUT-VALUE-BYTE-MISMATCH :EXPECTED-TESTS
 ("TEST-REQ-AFF-002-PERFORMANCE-OUTPUT-COPY") :STATUS :OK :RESULT :DETECTED
 :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "f02aa0f106df07f81dd79afa6ca86610") :COMPILED-TARGET
 (:FILE "src/get/lifecycle.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "f02aa0f106df07f81dd79afa6ca86610") :FASL
  #A((175) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/copy-from-previous-byte/fasl/src/get/lifecycle.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "40caf18b22a72632c11210eb3fa2be1a"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp" "TEST-REQ-AFF-002-PERFORMANCE-OUTPUT-COPY")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((158) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/copy-from-previous-byte/stdout.log")
  :STDERR-LOG
  #A((158) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/copy-from-previous-byte/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/lifecycle.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "f02aa0f106df07f81dd79afa6ca86610") :FASL
    #A((175) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/copy-from-previous-byte/fasl/src/get/lifecycle.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "40caf18b22a72632c11210eb3fa2be1a"))
   :FAILED-TEST "TEST-REQ-AFF-002-PERFORMANCE-OUTPUT-COPY" :PASSED-TESTS NIL
   :FAILURE-KIND :ASSERTION :CONDITION-TYPE #A((12) BASE-CHAR . "SIMPLE-ERROR")
   :DIAGNOSTIC
   #A((1122) BASE-CHAR
      . "Asserzione fallita: (LOOP ARCDOCDB.GET.PERFORMANCE.TESTS::FOR ARCDOCDB.GET.PERFORMANCE.TESTS::I ARCDOCDB.GET.PERFORMANCE.TESTS::BELOW (LENGTH
                                                                                                                                       ARCDOCDB.GET.PERFORMANCE.TESTS::VALUE)
                          ARCDOCDB.GET.PERFORMANCE.TESTS::ALWAYS (=
                                                                  (AREF
                                                                   ARCDOCDB.GET.PERFORMANCE.TESTS::VALUE
                                                                   ARCDOCDB.GET.PERFORMANCE.TESTS::I)
                                                                  (AREF
                                                                   ARCDOCDB.GET.PERFORMANCE.TESTS::OUTPUT
                                                                   (+
                                                                    ARCDOCDB.GET.PERFORMANCE.TESTS::START
                                                                    ARCDOCDB.GET.PERFORMANCE.TESTS::I))))"))))
