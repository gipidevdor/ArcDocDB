(:NAME "truncate-csn-high-bit" :FILE "src/get/segment.lisp" :DIRECTORY
 #A((146) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/truncate-csn-high-bit/")
 :SUBSTITUTION
 (:BEFORE "(verifica-put-parole bytes 0 size (contesto-get-key context)
                             (ldb (byte 32 32) (aref content 0))"
  :AFTER "(verifica-put-parole bytes 0 size (contesto-get-key context)
                             (ldb (byte 31 32) (aref content 0))")
 :EXPECTED-FAILURE :VALID-MAX-U64-CSN-REJECTED :EXPECTED-TESTS
 ("TEST-REQ-AFF-002-PERFORMANCE-MAX-U64-VERIFICATION") :STATUS :OK :RESULT
 :DETECTED :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "9e64d5eaf647ad7963c98332097080ae") :COMPILED-TARGET
 (:FILE "src/get/segment.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "9e64d5eaf647ad7963c98332097080ae") :FASL
  #A((171) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/truncate-csn-high-bit/fasl/src/get/segment.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "d6194ec0d8f80bf7ec791b6fddf60ff8"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp"
   "TEST-REQ-AFF-002-PERFORMANCE-MAX-U64-VERIFICATION")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((156) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/truncate-csn-high-bit/stdout.log")
  :STDERR-LOG
  #A((156) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/truncate-csn-high-bit/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/segment.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "9e64d5eaf647ad7963c98332097080ae") :FASL
    #A((171) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/truncate-csn-high-bit/fasl/src/get/segment.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "d6194ec0d8f80bf7ec791b6fddf60ff8"))
   :FAILED-TEST "TEST-REQ-AFF-002-PERFORMANCE-MAX-U64-VERIFICATION"
   :PASSED-TESTS NIL :FAILURE-KIND :PRODUCT-CONDITION :CONDITION-TYPE
   #A((19) BASE-CHAR . "CORRUPTION-DETECTED") :DIAGNOSTIC
   #A((35) BASE-CHAR . "ArcDocDB: CSN-MISMATCH all'offset 0"))))
