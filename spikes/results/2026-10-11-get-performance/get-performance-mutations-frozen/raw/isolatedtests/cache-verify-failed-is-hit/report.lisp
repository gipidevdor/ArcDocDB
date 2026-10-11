(:NAME "cache-verify-failed-is-hit" :FILE "src/get/target.lisp" :DIRECTORY
 #A((151) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/cache-verify-failed-is-hit/")
 :SUBSTITUTION
 (:BEFORE "(cerca-record-cache
     cache (segmento-get-high segment) (segmento-get-low segment)
     (ldb (byte 32 0) (aref content 1)) (ldb (byte 32 0) (aref content 3))
     (contesto-get-key context) (ldb (byte 32 32) (aref content 0))
     (ldb (byte 32 0) (aref content 0)) flags (contesto-get-bytes context) 0
     :version (segmento-get-version segment)
     :proof-buffer (if prepared (contesto-get-proof context) nil)
     :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0))"
  :AFTER "(multiple-value-bind (status start end)
        (cerca-record-cache
     cache (segmento-get-high segment) (segmento-get-low segment)
     (ldb (byte 32 0) (aref content 1)) (ldb (byte 32 0) (aref content 3))
     (contesto-get-key context) (ldb (byte 32 32) (aref content 0))
     (ldb (byte 32 0) (aref content 0)) flags (contesto-get-bytes context) 0
     :version (segmento-get-version segment)
     :proof-buffer (if prepared (contesto-get-proof context) nil)
     :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0))
      (if (eq status :verify-failed)
          (values :hit (+ +header-bytes+ (length (contesto-get-key context)))
                  (ldb (byte 32 0) (aref content 3)))
          (values status start end)))")
 :EXPECTED-FAILURE :CORRUPT-CACHE-AUTHORIZED-WITHOUT-SEGMENT-FALLBACK
 :EXPECTED-TESTS ("TEST-REQ-CCH-004-PERFORMANCE-CACHE-CRC-FALLBACK") :STATUS
 :OK :RESULT :DETECTED :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "525c538ee2f93d86c80871c57543d1e5") :COMPILED-TARGET
 (:FILE "src/get/target.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "525c538ee2f93d86c80871c57543d1e5") :FASL
  #A((175) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/cache-verify-failed-is-hit/fasl/src/get/target.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "cd95a5250e198b6cfadb9fb49421d865"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp"
   "TEST-REQ-CCH-004-PERFORMANCE-CACHE-CRC-FALLBACK")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((161) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/cache-verify-failed-is-hit/stdout.log")
  :STDERR-LOG
  #A((161) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/cache-verify-failed-is-hit/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/target.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "525c538ee2f93d86c80871c57543d1e5") :FASL
    #A((175) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/cache-verify-failed-is-hit/fasl/src/get/target.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "cd95a5250e198b6cfadb9fb49421d865"))
   :FAILED-TEST "TEST-REQ-CCH-004-PERFORMANCE-CACHE-CRC-FALLBACK" :PASSED-TESTS
   NIL :FAILURE-KIND :ASSERTION :CONDITION-TYPE
   #A((12) BASE-CHAR . "SIMPLE-ERROR") :DIAGNOSTIC
   #A((744) BASE-CHAR . "Asserzione fallita: (EQUAL
                     (LIST :SEGMENT
                           ARCDOCDB.GET.PERFORMANCE.TESTS::EXPECTED-CACHE
                           ARCDOCDB.GET.PERFORMANCE.TESTS::EXPECTED-INSERTION
                           NIL NIL)
                     (MULTIPLE-VALUE-LIST
                      (ARCDOCDB.GET:LEGGI-RECORD-GET
                       ARCDOCDB.GET.PERFORMANCE.TESTS::CONTEXT
                       (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-SEGMENT
                        ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                       (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-VALID-BYTES
                        ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                       0)))"))))
