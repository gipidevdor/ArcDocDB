(:schema-version 1 :kind :cbor-map-materialized-catalogue
 :status :materialized-static-only
 :method-blob "636dd2706c2903542978606cf029e7198bf4dbb3"
 :semantic-catalogue-blob "89900f1bebaf66af3b3b8e19e17596d438cbf936"
 :corpus-plan-blob "def50d1650ada2447dffedf13895ac85a40ee84a"
 :corpus-plan-path "spikes/out/cbor-map-write-20261014/review/blind-plan.md"
 :corpus-plan-declared-api-calls 9499
 :api "scrivi-mappa-cbor-minima"
 :planned-mutant-names
 ("physical-capacity" "wrong-major" "wrong-count" "scan-omitted"
  "overlap-without-header" "item-ends-unchecked" "root-node-excluded" "extra-return-value")
 :source-files (("src/codec/cbor-map-input.lisp" "d7a593badeb6e6b71f28dc4e80c641b07189d0b8")
  ("src/codec/cbor-map-write.lisp" "22e814ea68e606c5bc58033c2a31e945303a9d65"))
 :corpus-files (("tests/codec/cbor-map-write-support.lisp" "a389e51f2416437d608c4f7745b9680eca27bc60")
  ("tests/codec/cbor-map-write.lisp" "6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8")
  ("tests/codec/cbor-map-write-threads.lisp" "6a65b58ce236b92b33772e1861dbd8c1257bee13"))
 :other-driver-blobs (("bench.lisp" "eeaa1a0d34d6bd94d5cf7c1d62e9c4027b0f5027")
                      ("audit.lisp" "f6f08f777e8115e626f39e90f3722a72658d9750"))
 :raw-md5-pins (("src/codec/cbor-map-input.lisp" "e3d33d0453e2d2feb57730cb15f12dab")
  ("src/codec/cbor-map-write.lisp" "66ff30cb4a72e6486b4a942311da5336")
  ("tests/codec/cbor-map-write-support.lisp" "a37b9800d624e904ff1d7718fdfa1ca4")
  ("tests/codec/cbor-map-write.lisp" "5478566e25301bda7467493b25194ac2")
  ("tests/codec/cbor-map-write-threads.lisp" "d28fd876e394811eda74e8de5586bad6")
  ("spikes/out/cbor-map-write-20261014/drivers/fixtures-and-mutations.lisp" "66759726c5b63708a7cbce0be546d475")
  ("spikes/out/cbor-map-write-20261014/drivers/bench.lisp" "0dd9d0f178e39ff133da23bcf06f8b47")
  ("spikes/out/cbor-map-write-20261014/drivers/audit.lisp" "40c0e9f9b1c75e5918d6a34c107fa3bf"))
 :serial-nominal-tests 19 :parallel-nominal-tests 1 :frozen-nominal-test-count 20
 :frozen-def-test-functions
 ("ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-EMPTY-SCALAR-PAIR-AND-TWO-LITERAL-PAIRS"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-PAIR-COUNT-WIDTH-BOUNDARIES-AND-MINIMAL-HEADER"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-NESTED-UTF8-FLOATS-OPAQUE-BYTES-AND-PRESERVED-PAIR-ORDER"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-CONCATENATION-NEXT-AND-REUSED-SPACE"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-SOURCE-TYPE-RANGE-AND-BACKING-ARRAY-INTACT"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-TABLE-TYPE-COUNT-DOMAINS-AND-HALF-LENGTH-BEFORE-MULTIPLICATION"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-WORKSPACE-TYPE-AND-ALL-SCRATCH-ALIASES-EVEN-EMPTY"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-CONFIGURED-LIMITS-AND-EMPTY-ROOT-MINIMUM"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-STRICT-ACTIVE-ENDS-LAST-AND-UNREAD-EVEN-OR-ODD-TAIL"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-ALL-PREFLIGHT-PHASE-PRECEDENCES"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-OVERLAP-ENTIRE-FOOTPRINT-TOUCHING-AND-EMPTY"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-FULL-BYTE-BUDGET-KEY-PLUS-VALUE-EXACT-16MIB-AND-OVER"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-ROOT-KEY-VALUE-TAG-NODES-AND-ZERO-RESIDUE-BEFORE-RESET"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-ROOT-DEPTH-SCALARS-TAGS-AND-99-100-CHILD-CONTAINERS"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-KEY-AND-VALUE-PARSER-ERRORS-ABSOLUTE-AND-LEFT-TO-RIGHT"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-REUSE-AFTER-VALUE-PARSER-AND-PREFLIGHT-ERRORS"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-SCRATCH-LAST-VALUE-AND-ZERO-PAIRS-NO-RESET"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS"
  "ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS")
 :cold-origin-frame "27: (ARCDOCDB.CBOR.MAP.WRITE.TESTS::TEST-REQ-CBR-006-MAP-EMPTY-SCALAR-PAIR-AND-TWO-LITERAL-PAIRS)"
 :targets
 ((:source-file "src/codec/cbor-map-input.lisp" :name "physical-capacity"
   :before-occurrences 1 :before "(dimensioni-mappa-cbor start end span count max-bytes)" :after "(dimensioni-mappa-cbor start (length buffer) span count max-bytes)")
  (:source-file "src/codec/cbor-map-write.lisp" :name "wrong-major"
   :before-occurrences 1 :before "(scrivi-header-cbor-minimo bytes begin next 5 0 pairs)" :after "(scrivi-header-cbor-minimo bytes begin next 4 0 pairs)")
  (:source-file "src/codec/cbor-map-write.lisp" :name "wrong-count"
   :before-occurrences 1 :before "(pairs (the u32 count))" :after "(pairs (the u32 item-count))")
  (:source-file "src/codec/cbor-map-write.lisp" :name "scan-omitted"
   :before-occurrences 1 :before "(verifica-figli-mappa-cbor src source-begin source-limit item-ends items scratch max-nodes max-depth)" :after "(progn (identity items) (identity scratch) (values 1 1))")
  (:source-file "src/codec/cbor-map-input.lisp" :name "overlap-without-header"
   :before-occurrences 1 :before "(check-overlap-mappa-cbor buffer start (+ start item-size) source source-start source-end)" :after "(check-overlap-mappa-cbor buffer (+ start header-size) (+ start item-size) source source-start source-end)")
  (:source-file "src/codec/cbor-map-input.lisp" :name "item-ends-unchecked"
   :before-occurrences 1 :before "(check-fini-mappa-cbor item-ends (the u32 items) span)" :after "(progn (identity item-ends) (identity items) (identity span) nil)")
  (:source-file "src/codec/cbor-map-write.lisp" :name "root-node-excluded"
   :before-occurrences 1 :before "(let ((nodes 1) (peak 1) (cursor start) (child-depth (1- max-depth)))" :after "(let ((nodes 0) (peak 1) (cursor start) (child-depth (1- max-depth)))")
  (:source-file "src/codec/cbor-map-write.lisp" :name "extra-return-value"
   :before-occurrences 1 :before "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index &optional)) scrivi-mappa-cbor-minima))
(defun scrivi-mappa-cbor-minima (buffer start end source source-start source-end item-ends count space
                               &key (max-bytes +cbor-scan-max-bytes+)
                                 (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, fini simple u32; COUNT coppie e dati stabili,
destinazione/scratch esclusivi. Post: testata MT5 minima per COUNT e payload
esatto nello stesso ordine, un solo NEXT; solo [START,NEXT) cambia.
Budget includono radice e testata. Preflight e scansione di chiavi/valori
prima di scrivere: errori pubblici preservano interi array, offset NIL
o assoluto SOURCE per scanner. Scratch intatto nel preflight, riusabile
dopo parsing fallito; mappa vuota non lo usa. BUFFER=SOURCE solo disgiunto
dal footprint completo; alias scratch rifiutati. Nessun ordinamento/unicita.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia MT2/3.
Costo O(SPAN+2*COUNT*102); nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size item-count)
      (check-input-mappa-cbor buffer start end source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (items (the u32 item-count))
          (pairs (the u32 count)) (scratch (the spazio-cbor space))
          (next (+ (the index start) item-size)))
      (declare (type index next))
      (multiple-value-bind (nodes peak)
          (verifica-figli-mappa-cbor src source-begin source-limit item-ends items scratch max-nodes max-depth)
        (unless (<= nodes max-nodes)
          (error 'invariant-violation :reason :cbor-map-result-nodes))
        (unless (<= peak max-depth)
          (error 'invariant-violation :reason :cbor-map-result-depth)))
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 5 0 pairs)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-map-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-map-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-map-write-progress))
          result)))))" :after "(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index null &optional)) scrivi-mappa-cbor-minima))
(defun scrivi-mappa-cbor-minima (buffer start end source source-start source-end item-ends count space
                               &key (max-bytes +cbor-scan-max-bytes+)
                                 (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  \"Pre: simple u8, span half-open, fini simple u32; COUNT coppie e dati stabili,
destinazione/scratch esclusivi. Post: testata MT5 minima per COUNT e payload
esatto nello stesso ordine, un solo NEXT; solo [START,NEXT) cambia.
Budget includono radice e testata. Preflight e scansione di chiavi/valori
prima di scrivere: errori pubblici preservano interi array, offset NIL
o assoluto SOURCE per scanner. Scratch intatto nel preflight, riusabile
dopo parsing fallito; mappa vuota non lo usa. BUFFER=SOURCE solo disgiunto
dal footprint completo; alias scratch rifiutati. Nessun ordinamento/unicita.
INVARIANT-VIOLATION interno senza rollback, anche dalla copia MT2/3.
Costo O(SPAN+2*COUNT*102); nessun AST, thread, attesa, I/O o pubblicazione.\"
  (multiple-value-bind (span header-size item-size item-count)
      (check-input-mappa-cbor buffer start end source source-start source-end item-ends count space
                             max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (items (the u32 item-count))
          (pairs (the u32 count)) (scratch (the spazio-cbor space))
          (next (+ (the index start) item-size)))
      (declare (type index next))
      (multiple-value-bind (nodes peak)
          (verifica-figli-mappa-cbor src source-begin source-limit item-ends items scratch max-nodes max-depth)
        (unless (<= nodes max-nodes)
          (error 'invariant-violation :reason :cbor-map-result-nodes))
        (unless (<= peak max-depth)
          (error 'invariant-violation :reason :cbor-map-result-depth)))
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 5 0 pairs)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-map-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-map-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-map-write-progress))
          (values result nil))))))"))
 :limits (:semantic-eight-fixed :raw-exact-before-fragments :unique-targets-statically-checked
          :counter-pairs-binding-uses-item-count :scan-skip-valid-stats-and-consumed-bindings
          :node-index-admits-zero :extra-nil-whole-public-decl-and-defun-coherent-in-copy-only
          :actual-frozen-deftest-origins-only :no-source-or-corpus-modified
          :no-product-or-mutant-execution :compileability-still-requires-authorized-campaign
          :raw-hash-declarations-not-authenticity-proof :api-call-total-from-frozen-plan))
