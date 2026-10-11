(:NAME "repair-persistent-body-crc" :FILE "src/get/segment.lisp" :DIRECTORY
 #A((151) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/repair-persistent-body-crc/")
 :SUBSTITUTION
 (:BEFORE "(verifica-put-parole bytes 0 size (contesto-get-key context)
                             (ldb (byte 32 32) (aref content 0)) (ldb (byte 32 0) (aref content 0))
                             flags :version (segmento-get-version segment)
                             :proof-buffer (if prepared (contesto-get-proof context) nil)
                             :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0))"
  :AFTER "(progn
          (when (= (leggi-u32 bytes 0)
                   (arcdocdb.binary:crc32c bytes 4 +header-bytes+))
            (arcdocdb.binary:scrivi-u32 bytes 4
                                      (arcdocdb.binary:crc32c bytes +header-bytes+ size))
            (arcdocdb.binary:scrivi-u32 bytes 0
                                      (arcdocdb.binary:crc32c bytes 4 +header-bytes+)))
          (verifica-put-parole bytes 0 size (contesto-get-key context)
                             (ldb (byte 32 32) (aref content 0)) (ldb (byte 32 0) (aref content 0))
                             flags :version (segmento-get-version segment)
                             :proof-buffer (if prepared (contesto-get-proof context) nil)
                             :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0)))")
 :EXPECTED-FAILURE :PERSISTENT-BODY-CORRUPTION-AUTHORIZED :EXPECTED-TESTS
 ("TEST-REQ-AFF-002-PERFORMANCE-PERSISTENT-CRC-GUARD") :STATUS :OK :RESULT
 :DETECTED :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "17e779b2f194e4b7b65c5ebc2410094e") :COMPILED-TARGET
 (:FILE "src/get/segment.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "17e779b2f194e4b7b65c5ebc2410094e") :FASL
  #A((176) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/repair-persistent-body-crc/fasl/src/get/segment.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "d2b84150ac0b8a552e7856bb9f502151"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp"
   "TEST-REQ-AFF-002-PERFORMANCE-PERSISTENT-CRC-GUARD")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((161) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/repair-persistent-body-crc/stdout.log")
  :STDERR-LOG
  #A((161) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/repair-persistent-body-crc/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/get/segment.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "17e779b2f194e4b7b65c5ebc2410094e") :FASL
    #A((176) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/repair-persistent-body-crc/fasl/src/get/segment.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "d2b84150ac0b8a552e7856bb9f502151"))
   :FAILED-TEST "TEST-REQ-AFF-002-PERFORMANCE-PERSISTENT-CRC-GUARD"
   :PASSED-TESTS NIL :FAILURE-KIND :ASSERTION :CONDITION-TYPE
   #A((12) BASE-CHAR . "SIMPLE-ERROR") :DIAGNOSTIC
   #A((961) BASE-CHAR . "Asserzione fallita: (HANDLER-CASE
                     (PROGN
                      (PROGN
                       (ARCDOCDB.GET:LEGGI-RECORD-GET
                        ARCDOCDB.GET.PERFORMANCE.TESTS::CONTEXT
                        (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-SEGMENT
                         ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                        (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-VALID-BYTES
                         ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                        0)
                       (SETF ARCDOCDB.GET.PERFORMANCE.TESTS::AUTHORIZED T))
                      NIL)
                     (ARCDOCDB.CONDITIONS:CORRUPTION-DETECTED (CONDITION)
                      (EQ (ARCDOCDB.CONDITIONS:ERROR-REASON CONDITION)
                          (IF (EQ ARCDOCDB.GET.PERFORMANCE.TESTS::PART :HEADER)
                              :HEADER-CRC
                              :BODY-CRC))))"))))
