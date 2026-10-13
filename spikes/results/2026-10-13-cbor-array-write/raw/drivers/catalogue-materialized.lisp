(:schema-version 1 :kind :cbor-array-materialized-mutation-catalogue
 :client-date "2026-10-13"
 :semantic-catalogue-blob "a4fa768d64d7088eb69455f27bb3e80c76d1f6df"
 :method-blob "2f257c9e8a56a5182142934dada3f3b38b5bef65"
 :chronology :after-source-and-corpus-freeze-before-compilation
 :source-blobs (("src/codec/cbor-array-input.lisp" "d3b3d07fc18bd2a077c1a2d79020a76263b2779e")
                ("src/codec/cbor-array-write.lisp" "a410297c29c5d043ad60d3804bd3711e22c2833b"))
 :corpus-blobs (("tests/codec/cbor-array-write-support.lisp" "eb1fccadb205e375b4a2324a6b6725a860bb546f")
                ("tests/codec/cbor-array-write.lisp" "b13f58264f3cd97e1947ee52936732a7fcebe672")
                ("tests/codec/cbor-array-write-threads.lisp" "5720110265b67019937f08cbd949b4469a04b867"))
 :tool-blobs (("bench.lisp" "84f3589f17132e47afcfe13647bec17c5390ab5b")
              ("audit.lisp" "acf22658e86a70ab863f75182133cfece1afd1e5")
              ("fixtures-and-mutations.lisp" "a4fa768d64d7088eb69455f27bb3e80c76d1f6df"))
 :raw-md5 (("src/codec/cbor-array-input.lisp" "560fa1b10432d16edb830014e95ea4dc")
           ("src/codec/cbor-array-write.lisp" "0429206ab6069f053c66da4c56439cfb")
           ("tests/codec/cbor-array-write-support.lisp" "6b76f5728245279ac2549814c033bc91")
           ("tests/codec/cbor-array-write.lisp" "b9d14be96752dcf8318c82878549672c")
           ("tests/codec/cbor-array-write-threads.lisp" "9de35b86b0a0ca59064d840e49fe57b1")
           ("spikes/out/cbor-array-write-20261013/drivers/bench.lisp" "c38a3e0e2f0b4af26e3d3822aeb1dbfd")
           ("spikes/out/cbor-array-write-20261013/drivers/audit.lisp" "10199e93fa1c392eb8f5d81430c1838f")
           ("spikes/out/cbor-array-write-20261013/drivers/fixtures-and-mutations.lisp" "1bd3dde86b277aa6e7a05ae82d56662f"))
 :targets
 ((:name "physical-capacity" :path "src/codec/cbor-array-write.lisp" :before "(check-input-array-cbor buffer start end source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)" :after "(check-input-array-cbor buffer start (max end (length buffer)) source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)" :static-occurrences 1)
  (:name "wrong-major" :path "src/codec/cbor-array-write.lisp" :before "(scrivi-header-cbor-minimo bytes begin next 4 0 items)" :after "(scrivi-header-cbor-minimo bytes begin next 3 0 items)" :static-occurrences 1)
  (:name "wrong-count" :path "src/codec/cbor-array-write.lisp" :before "(scrivi-header-cbor-minimo bytes begin next 4 0 items)" :after "(scrivi-header-cbor-minimo bytes begin next 4 0 (1+ items))" :static-occurrences 1)
  (:name "scan-omitted" :path "src/codec/cbor-array-write.lisp" :before "(verifica-struttura-cbor-minima source start end space
                                     :max-bytes span :max-nodes remaining :max-depth child-depth)" :after "(progn (the spazio-cbor space) (values 1 0 end))" :static-occurrences 1)
  (:name "overlap-without-header" :path "src/codec/cbor-array-input.lisp" :before "(check-overlap-array-cbor buffer start (+ start item-size) source source-start source-end)" :after "(check-overlap-array-cbor buffer (+ start header-size) (+ start item-size) source source-start source-end)" :static-occurrences 1)
  (:name "item-ends-unchecked" :path "src/codec/cbor-array-input.lisp" :before "(check-fini-array-cbor item-ends (the u32 count) span)" :after "nil" :static-occurrences 1)
  (:name "root-node-excluded" :path "src/codec/cbor-array-write.lisp" :before "(let ((nodes 1) (peak 1) (cursor start) (child-depth (1- max-depth)))" :after "(let ((nodes 0) (peak 1) (cursor start) (child-depth (1- max-depth)))" :static-occurrences 1)
  (:name "extra-return-value" :path "src/codec/cbor-array-write.lisp" :before "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index &optional)) scrivi-array-cbor-minimo))
(defun scrivi-array-cbor-minimo (buffer start end source source-start source-end item-ends count space
                               &key (max-bytes +cbor-scan-max-bytes+)
                                 (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, fini relative simple u32; dati stabili,
destinazione/scratch esclusivi. Post: testata MT4 minima e payload esatto,
un solo NEXT; solo [START,NEXT) cambia. Budget includono radice e testata.
Preflight e scansione integrale prima di scrivere: errori pubblici preservano
tutti gli array fisici, offset NIL o assoluto SOURCE per gli errori scanner.
Scratch intatto nel preflight, riusabile dopo parsing fallito; vuoto non lo usa.
BUFFER=SOURCE ammesso solo disgiunto dal footprint, alias scratch rifiutati.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia condivisa MT2/3.
Costo O(SPAN+COUNT*102); nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size)
      (check-input-array-cbor buffer start end source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (items (the u32 count))
          (scratch (the spazio-cbor space)) (next (+ (the index start) item-size)))
      (declare (type index next))
      (multiple-value-bind (nodes peak)
          (verifica-figli-array-cbor src source-begin source-limit item-ends items scratch max-nodes max-depth)
        (unless (<= nodes max-nodes)
          (error 'invariant-violation :reason :cbor-array-result-nodes))
        (unless (<= peak max-depth)
          (error 'invariant-violation :reason :cbor-array-result-depth)))
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 4 0 items)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-array-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-array-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-array-write-progress))
          result)))))
" :after "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index null &optional)) scrivi-array-cbor-minimo))
(defun scrivi-array-cbor-minimo (buffer start end source source-start source-end item-ends count space
                               &key (max-bytes +cbor-scan-max-bytes+)
                                 (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, fini relative simple u32; dati stabili,
destinazione/scratch esclusivi. Post: testata MT4 minima e payload esatto,
un solo NEXT; solo [START,NEXT) cambia. Budget includono radice e testata.
Preflight e scansione integrale prima di scrivere: errori pubblici preservano
tutti gli array fisici, offset NIL o assoluto SOURCE per gli errori scanner.
Scratch intatto nel preflight, riusabile dopo parsing fallito; vuoto non lo usa.
BUFFER=SOURCE ammesso solo disgiunto dal footprint, alias scratch rifiutati.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia condivisa MT2/3.
Costo O(SPAN+COUNT*102); nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size)
      (check-input-array-cbor buffer start end source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (items (the u32 count))
          (scratch (the spazio-cbor space)) (next (+ (the index start) item-size)))
      (declare (type index next))
      (multiple-value-bind (nodes peak)
          (verifica-figli-array-cbor src source-begin source-limit item-ends items scratch max-nodes max-depth)
        (unless (<= nodes max-nodes)
          (error 'invariant-violation :reason :cbor-array-result-nodes))
        (unless (<= peak max-depth)
          (error 'invariant-violation :reason :cbor-array-result-depth)))
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 4 0 items)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-array-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-array-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-array-write-progress))
          (values result nil))))))
" :static-occurrences 1))
 :corpus-frame-function-whitelist
 ("ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-EMPTY-SCALAR-AND-FIVE-LITERAL-CHILDREN"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-COUNT-WIDTH-BOUNDARIES-AND-MINIMAL-HEADER"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-NESTED-TAG-MAP-TEXT-AND-RAW-FLOAT-PREFERENCE"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-CONCATENATION-NEXT-AND-REUSED-SPACE"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-SOURCE-TYPE-RANGE-AND-BACKING-ARRAY-INTACT"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-TABLE-TYPE-AND-COUNT-DOMAINS"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-WORKSPACE-TYPE-AND-ALL-SCRATCH-ALIASES-EVEN-EMPTY"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-CONFIGURED-LIMITS-AND-EMPTY-ROOT-MINIMUM"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-STRICT-ENTRY-ORDER-BOUNDS-LAST-AND-UNREAD-TAIL"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-ALL-PREFLIGHT-PHASE-PRECEDENCES"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-OVERLAP-ENTIRE-FOOTPRINT-TOUCHING-AND-EMPTY"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-FULL-BYTE-BUDGET-EXACT-16MIB-AND-ONE-OVER"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-ROOT-TAG-NODE-ACCOUNTING-AND-EXHAUSTED-RESIDUE"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-ROOT-DEPTH-SCALARS-TAGS-AND-99-100-CHILD-CONTAINERS"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-CHILD-ERRORS-ABSOLUTE-OFFSETS-AND-LEFT-TO-RIGHT"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-SCRATCH-LAST-CHILD-AND-ZERO-COUNT-NO-RESET"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS"
  "ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS")
 :cold-frame-literal "27: (ARCDOCDB.CBOR.ARRAY.WRITE.TESTS::TEST-REQ-CBR-005-ARRAY-EMPTY-SCALAR-AND-FIVE-LITERAL-CHILDREN)"
 :extra-arity-policy :whole-public-decl-and-defun-coherent-in-private-copy-only
 :limits (:static-targets-only :no-compilation-or-campaign
          :raw-hashes-not-authenticity-proof :no-source-byte-copy-in-this-catalogue
          :corpus-origin-requires-exact-frame-function-symbol :no-scalability-inference))
