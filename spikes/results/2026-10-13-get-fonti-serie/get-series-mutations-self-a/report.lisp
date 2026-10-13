(:COUNTERS
 (:BASELINE-PASSED 0 :BASELINE-FAILED 0 :DETECTED 0 :SURVIVED 0
  :COMPILATION-ERROR 0 :INFRASTRUCTURE-ERROR 0 :INVALID 0)
 :FINISHED-AT-UNIVERSAL-TIME 4000906320 :SCHEMA-VERSION 1 :KIND
 :GET-SERIES-MUTATIONS :STATUS :OK :ARGV
 ("--self-test" "spikes/out/get-series-mutations-self-a/")
 :STARTED-AT-UNIVERSAL-TIME 4000906320 :SELF-TEST
 (:STATUS :OK :CLASSIFIER-CASES 24 :ANCHOR-NEGATIVE-CASES 3 :NO-COMPILATION T
  :NO-CHILD T)
 :BASELINE NIL :MUTANTS NIL :TARGETS
 ((:NAME "planned-root-instead-of-published" :FILE
   "src/get-directory/sources-read.lisp" :TEST
   "TEST-REQ-WAL-006-SERIES-GET-ONE-ROOT-AFTER-PIN-DURING-PUBLICATION" :BEFORE
   "(root (leggi-radice-serie controller))" :AFTER
   "(root (arcdocdb.series::controllore-serie-planned-root controller))"
   :EXPECTED-FAILURE :PUBLISHED-ROOT-OR-SINGLE-ACQUIRE)
  (:NAME "accept-active-closed-duplicate" :FILE
   "src/get-directory/sources-read.lisp" :TEST
   "TEST-REQ-AFF-004-SERIES-GET-PUBLISHED-ACTIVE-DUPLICATE-FAULTED" :BEFORE
   "(guasto-get context :sources-active-duplicate)" :AFTER
   "(when (null active) (guasto-get context :sources-active-duplicate))"
   :EXPECTED-FAILURE :ACTIVE-CLOSED-DUPLICATE-ACCEPTED)
  (:NAME "dispatch-active-to-closed" :FILE
   "src/get-directory/sources-read.lisp" :TEST
   "TEST-REQ-IDX-001-SERIES-GET-ACTIVE-AND-CLOSED-MIXED" :BEFORE
   "(risolvi-candidato-radice-attiva-get context active)" :AFTER
   "(risolvi-candidato-directory-get context (fonti-get-serie-directory sources))"
   :EXPECTED-FAILURE :ACTIVE-SELECTION)
  (:NAME "active-end-one-byte-overrun" :FILE
   "src/get-resolver/active-read.lisp" :TEST
   "TEST-REQ-WAL-006-SERIES-GET-EXPLICIT-ROOT-PRESERVES-CAPTURED-PAGE" :BEFORE
   "(values segment end flags nil)" :AFTER
   "(values segment (1+ end) flags nil)" :EXPECTED-FAILURE
   :ACTIVE-COMMITTED-FRONTIER))
 :EXPECTED-TESTS NIL :SOURCE-CONSISTENCY :NOT-OBSERVED :RAW-ROOT
 "raw/evidence/" :COLLECTOR-EXCLUSIONS ("raw/isolatedtests/")
 :CHILD-DEADLINE-SECONDS 120 :CAMPAIGN-DEADLINE-SECONDS 900 :STATIC-RISKS
 (:PARENT-SOURCE-FREEZE-REQUIRED :NOT-EXECUTED-BY-AUTHOR
  :ONLY-FOUR-READ-MUTANTS :NEW-SERIES-SUITE-REQUIRED :NATIVE-FIXTURE-IO
  :SERIAL-FUNCTION-FI :COMPILER-FIXTURE-TYPE-IO-TIMEOUT-CRASH-NOT-KILLS
  :ISOLATEDCOPIES-EXCLUDED-FROM-COLLECTOR
  :EVIDENCE-DIRECTORY-MUST-BE-COLLECTED-WITH-TERMINAL-PRODUCER
  :MD5-FOR-LOCAL-BYTE-IDENTITY-NOT-ADVERSARIAL-ATTESTATION
  :NO-ENGINE-QUALIFICATION))
