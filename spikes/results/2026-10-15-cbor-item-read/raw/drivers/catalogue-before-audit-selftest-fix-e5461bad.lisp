(:SCHEMA-VERSION 1 :KIND :CBOR-ITEM-MATERIALIZED-CATALOGUE :STATUS
 :MATERIALIZED-STATIC-ONLY :METHOD-BLOB
 "a67a79bf4fefe11c4778cd881eb5279a006966ca" :SEMANTIC-CATALOGUE-BLOB
 "c6a22e6751cab0eff88dd1173ed81543d595a659" :CORPUS-PLAN-BLOB
 "63a749b0e8737f49d400f40b0a98c454c2dc3cfc" :CORPUS-PLAN-PATH
 "spikes/out/cbor-item-read-20261015/review/blind-plan.md"
 :CORPUS-PLAN-DECLARED-API-CALLS 9901 :API "leggi-item-cbor-minimo"
 :PLANNED-MUTANT-NAMES
 ("generic-scan" "drain-on-physical-end" "next-equals-end"
  "node-budget-ignored" "depth-budget-ignored" "byte-budget-ignored"
  "start-skipped" "extra-return-value")
 :SOURCE-FILES
 (("src/codec/cbor-item-read.lisp" "b9099dc8a8c96281063811e686deb4dcb2b1d39b"))
 :CORPUS-FILES
 (("tests/codec/cbor-item-read-support.lisp"
   "0326100362a1c4b24d2c7e511e45357f09a56d33")
  ("tests/codec/cbor-item-read.lisp"
   "b2cbdcb4255c51d9da4fe73b28939c1cb923fefe")
  ("tests/codec/cbor-item-read-threads.lisp"
   "a0da65545ed80ede0a967cadbb337731f6fe1ce9"))
 :OTHER-DRIVER-BLOBS
 (("bench.lisp" "118c779ca567411675e5dfbb0866b5b17e77c7f0")
  ("audit.lisp" "6cf528ab25ee0af5d785d501b6072970449a7fa4"))
 :RAW-MD5-PINS
 (("src/codec/cbor-item-read.lisp"
   #A((32) BASE-CHAR . "39603f3dc085bcae02483b1bf9028873"))
  ("tests/codec/cbor-item-read-support.lisp"
   #A((32) BASE-CHAR . "3ceff80b07a22daa735182ca2e883a5e"))
  ("tests/codec/cbor-item-read.lisp"
   #A((32) BASE-CHAR . "a1c2e6a5183ac641f4c4b0c6b6a6d85a"))
  ("tests/codec/cbor-item-read-threads.lisp"
   #A((32) BASE-CHAR . "1d70056a06ee35c7fad0c57de5d4bba6"))
  ("spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp"
   #A((32) BASE-CHAR . "8dfd03d8510d882e533d68b79bab1073"))
  ("spikes/out/cbor-item-read-20261015/drivers/bench.lisp"
   #A((32) BASE-CHAR . "075fd8060d77c8665164a2d20c12b417"))
  ("spikes/out/cbor-item-read-20261015/drivers/audit.lisp"
   #A((32) BASE-CHAR . "5c8ec64487f8c95e4f1d8cc09fb170d0")))
 :SERIAL-NOMINAL-TESTS 16 :PARALLEL-NOMINAL-TESTS 1 :FROZEN-NOMINAL-TEST-COUNT
 17 :NOMINAL-LINE-SELECTOR
 ("rg" "--no-filename" "^\\(deftest test-REQ-CBR-008-"
  "tests/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-threads.lisp")
 :FROZEN-DEF-TEST-FUNCTIONS
 ("ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-BUFFER"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-LITERAL-ALL-MAJORS-AND-UNREAD-POISON-TAIL"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-INTEGER-TAG-AND-STRING-WIDTH-BOUNDARIES"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-CONCATENATED-FRONTIERS-AND-EXACT-SCANNERS-STILL-TRAILING"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-AUTHORIZED-END-PHYSICAL-SENTINELS-AND-NONZERO-START"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-BUFFER-TYPE-RANGE-AND-WHOLE-BACKING-ARRAY-PRESERVATION"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-WORKSPACE-TYPE-ALIAS-AND-PREFLIGHT-BEFORE-RESET"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-CONFIGURED-LIMITS-AND-ALL-PREFLIGHT-PRECEDENCES"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-BYTE-BUDGET-INCLUDES-ENTIRE-WINDOW-AND-UNREAD-TAIL"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-ROOT-AND-TAG-CHAIN-NODE-BUDGET-WITHOUT-TAIL-NODES"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-DEPTH-ZERO-AND-100-101-WITHOUT-TAIL-DEPTH"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-MALFORMED-FIRST-ITEM-ABSOLUTE-ERRORS-AND-MINIMALITY"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-EVERY-TRUNCATION-IS-BOUNDED-BY-AUTHORIZED-END"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-HEADER-PREFERENCE-BEFORE-NODES-DEPTH-AND-PAYLOAD"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-SCRATCH-REUSE-AND-CONTENT-STATISTICS-WITHOUT-TAIL"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-FULL-16MIB-WINDOW-TAIL-AND-COMPLETE-PAYLOAD-BOUNDARY"
  "ARCDOCDB.CBOR.ITEM.READ.TESTS::TEST-REQ-CBR-008-ITEM-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS")
 :UNIQUE-SOURCE-SUBSTITUTIONS
 (("src/codec/cbor-item-read.lisp" "generic-scan"
   "(passo-struttura-cbor bytes scratch limit node-limit depth-limit t)"
   "(passo-struttura-cbor bytes scratch limit node-limit depth-limit nil)")
  ("src/codec/cbor-item-read.lisp" "drain-on-physical-end"
   "(when (svuota-frame-cbor scratch (spazio-cbor-cursor scratch)) (return))"
   "(when (svuota-frame-cbor scratch limit) (return))")
  ("src/codec/cbor-item-read.lisp" "next-equals-end"
   "(risultato-struttura-cbor scratch next node-limit depth-limit)"
   "(progn (setf (spazio-cbor-cursor scratch) limit) (risultato-struttura-cbor scratch limit node-limit depth-limit))")
  ("src/codec/cbor-item-read.lisp" "node-budget-ignored"
   "(node-limit (the (integer 1 16777216) max-nodes))"
   "(node-limit (the (integer 1 16777216) +cbor-scan-max-bytes+))")
  ("src/codec/cbor-item-read.lisp" "depth-budget-ignored"
   "(depth-limit (the (integer 0 100) max-depth))"
   "(depth-limit (the (integer 0 100) +cbor-scan-max-depth+))")
  ("src/codec/cbor-item-read.lisp" "byte-budget-ignored"
   "(check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)"
   "(check-input-struttura-cbor buffer start end space (progn (identity max-bytes) +cbor-scan-max-bytes+) max-nodes max-depth)")
  ("src/codec/cbor-item-read.lisp" "start-skipped" "(begin (the index start))"
   "(begin (the index 0))")
  ("src/codec/cbor-item-read.lisp" "extra-return-value"
   "(declaim (ftype (function (t t t t &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index (integer 0 100) index &optional)) leggi-item-cbor-minimo))
(defun leggi-item-cbor-minimo (buffer start end space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8 stabile, finestra e budget verificati; scratch privato.
Post: esattamente NODES, PEAK array/map, NEXT assoluto del primo item minimo;
START<NEXT<=END, coda non letta, statistiche del solo item. MAX-BYTES limita
l'intera finestra, coda inclusa. Preflight senza mutare scratch; reset prima
del parsing, riuso dopo errore. Propaga INVALID-ARGUMENT, RESOURCE-EXHAUSTED,
CORRUPTION-DETECTED (offset assoluti) e INVARIANT-VIOLATION.
Al piu SPAN passi e drain102; nessun AST, semantica tag, attesa o I/O.\"
  (let ((span (check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)))
    (declare (type index span))
    (unless (<= span +cbor-scan-max-bytes+)
      (error 'invariant-violation :reason :cbor-item-loop-span))
    (let ((bytes (the octets buffer)) (begin (the index start)) (limit (the index end))
          (scratch (the spazio-cbor space))
          (node-limit (the (integer 1 16777216) max-nodes))
          (depth-limit (the (integer 0 100) max-depth)))
      (azzera-spazio-cbor scratch begin)
      (loop repeat span
            do (when (svuota-frame-cbor scratch (spazio-cbor-cursor scratch)) (return))
               (passo-struttura-cbor bytes scratch limit node-limit depth-limit t))
      (unless (svuota-frame-cbor scratch (spazio-cbor-cursor scratch))
        (unless (= (spazio-cbor-cursor scratch) limit)
          (error 'invariant-violation :reason :cbor-item-loop-bound))
        (leggi-header-cbor bytes limit limit)
        (error 'invariant-violation :reason :cbor-item-empty-header))
      (let ((next (spazio-cbor-cursor scratch)))
        (declare (type index next))
        (unless (< begin next)
          (error 'invariant-violation :reason :cbor-item-read-progress))
        (unless (<= next limit)
          (error 'invariant-violation :reason :cbor-item-read-range))
        (risultato-struttura-cbor scratch next node-limit depth-limit)))))"
   "(declaim (ftype (function (t t t t &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index (integer 0 100) index null &optional)) leggi-item-cbor-minimo))
(defun leggi-item-cbor-minimo (buffer start end space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8 stabile, finestra e budget verificati; scratch privato.
Post: esattamente NODES, PEAK array/map, NEXT assoluto del primo item minimo;
START<NEXT<=END, coda non letta, statistiche del solo item. MAX-BYTES limita
l'intera finestra, coda inclusa. Preflight senza mutare scratch; reset prima
del parsing, riuso dopo errore. Propaga INVALID-ARGUMENT, RESOURCE-EXHAUSTED,
CORRUPTION-DETECTED (offset assoluti) e INVARIANT-VIOLATION.
Al piu SPAN passi e drain102; nessun AST, semantica tag, attesa o I/O.\"
  (let ((span (check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)))
    (declare (type index span))
    (unless (<= span +cbor-scan-max-bytes+)
      (error 'invariant-violation :reason :cbor-item-loop-span))
    (let ((bytes (the octets buffer)) (begin (the index start)) (limit (the index end))
          (scratch (the spazio-cbor space))
          (node-limit (the (integer 1 16777216) max-nodes))
          (depth-limit (the (integer 0 100) max-depth)))
      (azzera-spazio-cbor scratch begin)
      (loop repeat span
            do (when (svuota-frame-cbor scratch (spazio-cbor-cursor scratch)) (return))
               (passo-struttura-cbor bytes scratch limit node-limit depth-limit t))
      (unless (svuota-frame-cbor scratch (spazio-cbor-cursor scratch))
        (unless (= (spazio-cbor-cursor scratch) limit)
          (error 'invariant-violation :reason :cbor-item-loop-bound))
        (leggi-header-cbor bytes limit limit)
        (error 'invariant-violation :reason :cbor-item-empty-header))
      (let ((next (spazio-cbor-cursor scratch)))
        (declare (type index next))
        (unless (< begin next)
          (error 'invariant-violation :reason :cbor-item-read-progress))
        (unless (<= next limit)
          (error 'invariant-violation :reason :cbor-item-read-range))
        (multiple-value-bind (nodes peak position) (risultato-struttura-cbor scratch next node-limit depth-limit) (values nodes peak position nil))))))"))
 :CAMPAIGN-EXECUTED NIL :SELF-TESTS-EXECUTED NIL :LIMITS
 (:STATIC-MATERIALIZATION-ONLY :SOURCE-STRINGS-NOT-LOADED
  :CORPUS-ONLY-PINNED-DIGESTS-AND-DEFTEST-NAME-LINES-READ
  :EXTRA-VALUE-MUTANT-HAS-COHERENT-LOCAL-FTYPE :PRIVATE-PER-COPY-FASL-CACHE
  :NO-COMPILATION-OR-PRODUCT-EXECUTION-BEFORE-C1-AND-C4))
