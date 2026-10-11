(:NAME "omit-abandon-read-pin" :FILE "src/get/lifecycle.lisp" :DIRECTORY
 #A((146) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/omit-abandon-read-pin/")
 :SUBSTITUTION
 (:BEFORE "(abbandona-lettura (contesto-get-reader context))" :AFTER
  "(identity (contesto-get-reader context))")
 :EXPECTED-FAILURE :ACTIVE-EBR-PIN-AFTER-ABANDON :EXPECTED-TESTS
 ("TEST-REQ-CMP-007-PERFORMANCE-CLEANUP") :STATUS :OK :RESULT :DETECTED
 :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "90c4429723109cf24d83b245c0f42bb4") :COMPILED-TARGET
 (:FILE "src/get/lifecycle.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "90c4429723109cf24d83b245c0f42bb4") :FASL
  #A((173) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/omit-abandon-read-pin/fasl/src/get/lifecycle.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "c46ef21b97bd3d464ff466144e3d2932"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp" "TEST-REQ-CMP-007-PERFORMANCE-CLEANUP")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((156) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/omit-abandon-read-pin/stdout.log")
  :STDERR-LOG
  #A((156) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/omit-abandon-read-pin/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/lifecycle.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "90c4429723109cf24d83b245c0f42bb4") :FASL
    #A((173) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/omit-abandon-read-pin/fasl/src/get/lifecycle.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "c46ef21b97bd3d464ff466144e3d2932"))
   :FAILED-TEST "TEST-REQ-CMP-007-PERFORMANCE-CLEANUP" :PASSED-TESTS NIL
   :FAILURE-KIND :ASSERTION :CONDITION-TYPE #A((12) BASE-CHAR . "SIMPLE-ERROR")
   :DIAGNOSTIC
   #A((347) BASE-CHAR . "Asserzione fallita: (NOT
                     (ARCDOCDB.EPOCHS:EPOCA-ATTIVA-P
                      (ARCDOCDB.EPOCHS:CONTESTO-EPOCA
                       (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-EPOCHS
                        ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                       ARCDOCDB.GET.PERFORMANCE.TESTS::WORKER)))"))))
