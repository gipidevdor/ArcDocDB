(:NAME "hide-repaired-cache-copy" :FILE "src/cache/read.lisp" :DIRECTORY
 #A((149) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/hide-repaired-cache-copy/")
 :SUBSTITUTION
 (:BEFORE "(zerop (aref (classe-cache-rejected class) slot))
                     (tag-cache-p class slot segment-high segment-low offset size)"
  :AFTER "(identity t)
                     (tag-cache-p class slot segment-high segment-low offset size)")
 :EXPECTED-FAILURE :REPAIRED-COPY-HIDDEN-BY-REJECTED-TAG :EXPECTED-TESTS
 ("TEST-REQ-CCH-004-PERFORMANCE-CACHE-REPAIR-HIT") :STATUS :OK :RESULT
 :DETECTED :DIAGNOSTIC NIL :TARGET-SOURCE-MD5
 #A((32) BASE-CHAR . "bb439a27ec15015da690faae75fcc760") :COMPILED-TARGET
 (:FILE "src/cache/read.lisp" :SOURCE-MD5
  #A((32) BASE-CHAR . "bb439a27ec15015da690faae75fcc760") :FASL
  #A((173) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/hide-repaired-cache-copy/fasl/src/cache/read.fasl")
  :FASL-MD5 #A((32) BASE-CHAR . "1d11d1466b2df5d36f3dc8f444a0b801"))
 :EXECUTION
 (:ARGV
  ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
   "--script" "isolated-build.lisp"
   "TEST-REQ-CCH-004-PERFORMANCE-CACHE-REPAIR-HIT")
  :EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :STDOUT-LOG
  #A((159) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/hide-repaired-cache-copy/stdout.log")
  :STDERR-LOG
  #A((159) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/hide-repaired-cache-copy/stderr.log")
  :REPORT
  (:SCHEMA-VERSION 1 :KIND :GET-PERFORMANCE-MUTATION-CHILD :PHASE :TESTS
   :STATUS :FAILED :PRODUCT-COMPILED T :SUITE-COMPILED T :COMPILED-TARGET
   (:FILE "src/cache/read.lisp" :SOURCE-MD5
    #A((32) BASE-CHAR . "bb439a27ec15015da690faae75fcc760") :FASL
    #A((173) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB/spikes/out/get-performance-mutations-frozen/raw/isolatedtests/hide-repaired-cache-copy/fasl/src/cache/read.fasl")
    :FASL-MD5 #A((32) BASE-CHAR . "1d11d1466b2df5d36f3dc8f444a0b801"))
   :FAILED-TEST "TEST-REQ-CCH-004-PERFORMANCE-CACHE-REPAIR-HIT" :PASSED-TESTS
   NIL :FAILURE-KIND :ASSERTION :CONDITION-TYPE
   #A((12) BASE-CHAR . "SIMPLE-ERROR") :DIAGNOSTIC
   #A((606) BASE-CHAR
      . "Asserzione fallita: (EQUAL '(:CACHE :HIT :NOT-ATTEMPTED NIL NIL)
                           (MULTIPLE-VALUE-LIST
                            (ARCDOCDB.GET:LEGGI-RECORD-GET
                             ARCDOCDB.GET.PERFORMANCE.TESTS::CONTEXT
                             (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-SEGMENT
                              ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                             (ARCDOCDB.GET.PERFORMANCE.TESTS:GET-PERFORMANCE-FIXTURE-VALID-BYTES
                              ARCDOCDB.GET.PERFORMANCE.TESTS::FIXTURE)
                             0)))"))))
