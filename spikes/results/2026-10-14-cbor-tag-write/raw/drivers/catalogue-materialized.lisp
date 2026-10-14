(:SCHEMA-VERSION 1 :KIND :CBOR-TAG-MATERIALIZED-CATALOGUE :STATUS
 :MATERIALIZED-STATIC-ONLY :METHOD-BLOB
 "3175390e496173398781bf8b39170cb33892125f" :SEMANTIC-CATALOGUE-BLOB
 "3c410448af31a28e99fe39f93261ced04f15860d" :CORPUS-PLAN-BLOB
 "71f0cbd4f4b9e2c180c2fe4dde208fa8d88a6787" :CORPUS-PLAN-PATH
 "spikes/out/cbor-tag-write-20261014/review/blind-plan.md"
 :CORPUS-PLAN-DECLARED-API-CALLS 9658 :API "scrivi-tag-cbor-minimo"
 :PLANNED-MUTANT-NAMES
 ("physical-capacity" "wrong-major" "swapped-words" "scan-omitted"
  "overlap-without-header" "root-node-excluded" "tag-depth-charged"
  "extra-return-value")
 :SOURCE-FILES
 (("src/codec/cbor-tag-input.lisp" "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
  ("src/codec/cbor-tag-write.lisp" "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b"))
 :CORPUS-FILES
 (("tests/codec/cbor-tag-write-support.lisp"
   "15978d05251705387205d6468031a701ad95ec85")
  ("tests/codec/cbor-tag-write.lisp"
   "df97950ec8d24157bb6566c7995262f7beea7742")
  ("tests/codec/cbor-tag-write-threads.lisp"
   "def870295400af2c84ca00e7a9b5cd5b747ec315"))
 :OTHER-DRIVER-BLOBS
 (("bench.lisp" "4f4e2ac97f2f9d903dfebfdc6b15553b40e59a84")
  ("audit.lisp" "97f58bffaff8c7dbccec76d1e28082bca0695ec6"))
 :RAW-MD5-PINS
 (("src/codec/cbor-tag-input.lisp"
   #A((32) BASE-CHAR . "e7979d8a4fd14175c15e0f407c96fb3c"))
  ("src/codec/cbor-tag-write.lisp"
   #A((32) BASE-CHAR . "ca0697060604db0499c90f1cc59d6b50"))
  ("tests/codec/cbor-tag-write-support.lisp"
   #A((32) BASE-CHAR . "c360e9b6acc186421291f4cc6946b8df"))
  ("tests/codec/cbor-tag-write.lisp"
   #A((32) BASE-CHAR . "d697c11e86af9e64a3519707b58aad82"))
  ("tests/codec/cbor-tag-write-threads.lisp"
   #A((32) BASE-CHAR . "25dbe24e1ab621741618fbfe1954af01"))
  ("spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp"
   #A((32) BASE-CHAR . "5c0dbc229bfcc07c2d9c9e581affe2ae"))
  ("spikes/out/cbor-tag-write-20261014/drivers/bench.lisp"
   #A((32) BASE-CHAR . "6a8a3180a812088c238f3493fa957cc0"))
  ("spikes/out/cbor-tag-write-20261014/drivers/audit.lisp"
   #A((32) BASE-CHAR . "1fc5854f263ec4eaaae6f8c65c260b08")))
 :SERIAL-NOMINAL-TESTS 19 :PARALLEL-NOMINAL-TESTS 1 :FROZEN-NOMINAL-TEST-COUNT
 20 :NOMINAL-LINE-SELECTOR
 ("rg" "--no-filename" "^\\(deftest test-REQ-CBR-007-"
  "tests/codec/cbor-tag-write.lisp" "tests/codec/cbor-tag-write-threads.lisp")
 :FROZEN-DEF-TEST-FUNCTIONS
 ("ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-SOURCE"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-U32-WORD-WIDTH-BOUNDARIES-AND-ALL-WIRE-SENTINELS"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-OPAQUE-SCALARS-UTF8-FLOATS-CONTAINERS-AND-PAIR-ORDER"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-CONCATENATION-NEXT-AND-EXACT-RETURN-ARITY"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-SOURCE-TYPE-RANGE-EMPTY-AND-BACKING-ARRAY-INTACT"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-HIGH-THEN-LOW-DOMAIN-PRECEDENCE-WITHOUT-U64"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-WORKSPACE-TYPE-AND-BOTH-KINDS-ALIASES"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-CONFIGURED-LIMITS-AND-ROOT-TWO-NODE-MINIMUM"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-ALL-PREFLIGHT-PHASE-PRECEDENCES"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-CAPACITY-ACTIVE-END-AND-COMPLETE-BYTE-BUDGET"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-OVERLAP-INCLUDING-ONLY-HEADER-AND-TOUCHING-BOUNDARIES"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-FULL-16MIB-WITH-ONE-AND-NINE-BYTE-HEADER-AND-OVER"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-ROOT-AND-CONTENT-NODE-RESIDUE-LONG-TAG-CHAINS-NO-FRAME"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-DEPTH-UNCHANGED-ZERO-SCALARS-AND-100-101-CONTAINERS"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-PARSER-FAILURES-ABSOLUTE-OFFSET-AND-COMPLETE-SINGLE-ITEM"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-EVERY-TRUNCATION-NONZERO-SOURCE-START-AND-EXACT-END"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-SCRATCH-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-SCRATCH-CONTENT-ONLY-STATISTICS-AFTER-SUCCESS"
  "ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS")
 :UNIQUE-SOURCE-SUBSTITUTIONS
 (("src/codec/cbor-tag-input.lisp" "physical-capacity"
   "(dimensioni-tag-cbor start end span high low max-bytes)"
   "(dimensioni-tag-cbor start (length buffer) span high low max-bytes)")
  ("src/codec/cbor-tag-write.lisp" "wrong-major"
   "(scrivi-header-cbor-minimo bytes begin next 6 hi lo)"
   "(scrivi-header-cbor-minimo bytes begin next 5 hi lo)")
  ("src/codec/cbor-tag-write.lisp" "swapped-words"
   "(scrivi-header-cbor-minimo bytes begin next 6 hi lo)"
   "(scrivi-header-cbor-minimo bytes begin next 6 lo hi)")
  ("src/codec/cbor-tag-write.lisp" "scan-omitted"
   "(verifica-contenuto-tag-cbor src source-begin source-limit scratch span max-nodes max-depth)"
   "(progn (identity src) (identity source-begin) (identity source-limit) (identity scratch) (identity span) (identity max-nodes) (identity max-depth) nil)")
  ("src/codec/cbor-tag-input.lisp" "overlap-without-header"
   "(check-overlap-tag-cbor buffer start (+ start item-size) source source-start source-end)"
   "(check-overlap-tag-cbor buffer (+ start header-size) (+ start item-size) source source-start source-end)")
  ("src/codec/cbor-tag-write.lisp" "root-node-excluded"
   ":max-bytes span :max-nodes (1- max-nodes) :max-depth max-depth"
   ":max-bytes span :max-nodes max-nodes :max-depth max-depth")
  ("src/codec/cbor-tag-write.lisp" "tag-depth-charged"
   ":max-bytes span :max-nodes (1- max-nodes) :max-depth max-depth"
   ":max-bytes span :max-nodes (1- max-nodes) :max-depth (1- max-depth)")
  ("src/codec/cbor-tag-write.lisp" "extra-return-value"
   "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index &optional)) scrivi-tag-cbor-minimo))
(defun scrivi-tag-cbor-minimo (buffer start end source source-start source-end high low space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, contenuto non vuoto/minimo, parole u32 stabili;
destinazione/scratch esclusivi. Post: header MT6 minimo e contenuto esatto,
un solo NEXT, solo [START,NEXT) cambia. Budget byte/nodi includono il tag;
MAX-DEPTH conta solo array/map e rimane invariato per il contenuto.
Tutti gli errori pubblici precedono la scrittura e preservano gli interi array;
offset NIL nel preflight o assoluto SOURCE nello scanner. Preflight conserva
SPACE; parsing fallito lo puo sporcare, riusabile dopo reset. A successo
descrive il contenuto, senza il nodo tag aggiunto. BUFFER=SOURCE solo disgiunto
dal footprint completo, alias scratch rifiutati. Nessuna semantica dei tag.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia MT2/3.
Lavoro limitato a SPAN*102; nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size)
      (check-input-tag-cbor buffer start end source source-start source-end high low space
                            max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (scratch (the spazio-cbor space))
          (hi (the u32 high)) (lo (the u32 low)) (next (+ (the index start) item-size)))
      (declare (type index next))
      (verifica-contenuto-tag-cbor src source-begin source-limit scratch span max-nodes max-depth)
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 6 hi lo)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-tag-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-tag-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-tag-write-progress))
          result)))))"
   "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index null &optional)) scrivi-tag-cbor-minimo))
(defun scrivi-tag-cbor-minimo (buffer start end source source-start source-end high low space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, contenuto non vuoto/minimo, parole u32 stabili;
destinazione/scratch esclusivi. Post: header MT6 minimo e contenuto esatto,
un solo NEXT, solo [START,NEXT) cambia. Budget byte/nodi includono il tag;
MAX-DEPTH conta solo array/map e rimane invariato per il contenuto.
Tutti gli errori pubblici precedono la scrittura e preservano gli interi array;
offset NIL nel preflight o assoluto SOURCE nello scanner. Preflight conserva
SPACE; parsing fallito lo puo sporcare, riusabile dopo reset. A successo
descrive il contenuto, senza il nodo tag aggiunto. BUFFER=SOURCE solo disgiunto
dal footprint completo, alias scratch rifiutati. Nessuna semantica dei tag.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia MT2/3.
Lavoro limitato a SPAN*102; nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size)
      (check-input-tag-cbor buffer start end source source-start source-end high low space
                            max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (scratch (the spazio-cbor space))
          (hi (the u32 high)) (lo (the u32 low)) (next (+ (the index start) item-size)))
      (declare (type index next))
      (verifica-contenuto-tag-cbor src source-begin source-limit scratch span max-nodes max-depth)
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 6 hi lo)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-tag-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-tag-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-tag-write-progress))
          (values result nil))))))"))
 :CAMPAIGN-EXECUTED NIL :SELF-TESTS-EXECUTED NIL :LIMITS
 (:STATIC-MATERIALIZATION-ONLY :SOURCE-STRINGS-NOT-LOADED
  :CORPUS-ONLY-PINNED-DIGESTS-AND-DEFTEST-NAME-LINES-READ
  :POST-GUARDS-CAN-INTERCEPT-MUTANT-BEFORE-CORRUPTION
  :NO-COMPILATION-OR-PRODUCT-EXECUTION-BEFORE-C1-AND-C4))
