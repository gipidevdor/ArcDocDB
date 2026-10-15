(:schema-version 1 :kind :cbor-string-read-mutation-catalog
 :product "src/codec/cbor-string-read.lisp"
 :frozen-blobs
 (("src/codec/cbor-string-read.lisp" "d4a4f774c2264c46349e7eda61ee4a2a3118d742")
  ("tests/codec/cbor-string-read-support.lisp" "cfd55cd47d782673113e67af625c1360195a345c")
  ("tests/codec/cbor-string-read.lisp" "8437bdcaa4cf308dbf4614e748cdab4be2ae6d62")
  ("tests/codec/cbor-string-read-threads.lisp" "8fc4ae5d9214108a6ae6bf26e644db1a42733cdd"))
 :sources
 ("src/package.lisp"
  "src/foundation/package.lisp" "src/foundation/conditions.lisp" "src/foundation/binary.lisp"
  "src/foundation/crc32c.lisp" "src/foundation/record.lisp" "src/foundation/batch.lisp"
  "src/codec/package.lisp" "src/codec/utf8.lisp" "src/codec/cbor-package.lisp"
  "src/codec/cbor-header.lisp" "src/codec/cbor-float-minimal.lisp" "src/codec/cbor-minimal.lisp"
  "src/codec/cbor-space.lisp" "src/codec/cbor-scan-input.lisp" "src/codec/cbor-scan-stack.lisp"
  "src/codec/cbor-scan-items.lisp" "src/codec/cbor-scan.lisp" "src/codec/cbor-scan-minimal.lisp"
  "src/codec/cbor-write.lisp" "src/codec/cbor-string-write.lisp" "src/codec/cbor-simple-write.lisp"
  "src/codec/cbor-float-narrow.lisp" "src/codec/cbor-float-write.lisp"
  "src/codec/cbor-array-input.lisp" "src/codec/cbor-array-write.lisp"
  "src/codec/cbor-map-input.lisp" "src/codec/cbor-map-write.lisp"
  "src/codec/cbor-tag-input.lisp" "src/codec/cbor-tag-write.lisp"
  "src/codec/cbor-item-read.lisp" "src/codec/cbor-string-read.lisp"
  "tests/foundation/support.lisp" "tests/codec/cbor-support.lisp"
  "tests/codec/cbor-structure-support.lisp" "tests/codec/cbor-string-read-support.lisp"
  "tests/codec/cbor-string-read.lisp" "tests/codec/cbor-string-read-threads.lisp")
 :test-package "ARCDOCDB.CBOR.STRING.READ.TESTS"
 :tests
 ("TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS"
  "TEST-REQ-CBR-009-STRING-LENGTH-WIDTH-BOUNDARIES-AND-PAYLOAD-OFFSET"
  "TEST-REQ-CBR-009-STRING-RAW-BYTES-NEVER-VALIDATED-AS-UTF8"
  "TEST-REQ-CBR-009-STRING-CONCATENATION-AND-ZERO-LENGTH-PAYLOAD-FRONTIERS"
  "TEST-REQ-CBR-009-STRING-BUFFER-TYPE-RANGE-AND-BACKING-ARRAY-PRESERVED"
  "TEST-REQ-CBR-009-STRING-BYTE-LIMIT-DOMAIN-AND-PREFLIGHT-PRECEDENCES"
  "TEST-REQ-CBR-009-STRING-BUDGET-COVERS-WHOLE-WINDOW-AND-EMPTY-SPAN"
  "TEST-REQ-CBR-009-STRING-TYPE-PRECEDES-FIT-FOR-EVERY-OTHER-MAJOR"
  "TEST-REQ-CBR-009-STRING-HEADER-SYNTAX-AND-MINIMALITY-PRECEDE-TYPE"
  "TEST-REQ-CBR-009-STRING-NONMINIMAL-LENGTHS-BEFORE-FIT-OR-UTF8"
  "TEST-REQ-CBR-009-STRING-U64-LENGTH-AND-LOW-WORD-FIT-BEFORE-PAYLOAD"
  "TEST-REQ-CBR-009-STRING-EVERY-HEADER-AND-PAYLOAD-TRUNCATION-AT-AUTHORIZED-END"
  "TEST-REQ-CBR-009-STRING-UTF8-REASONS-AND-ABSOLUTE-PAYLOAD-OFFSETS"
  "TEST-REQ-CBR-009-STRING-FIT-BEFORE-UTF8-AND-VALIDATION-STOPS-AT-PAYLOAD-END"
  "TEST-REQ-CBR-009-STRING-FULL-16MIB-WINDOW-PAYLOAD-AND-ONE-BYTE-OVER"
  "TEST-REQ-CBR-009-STRING-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASSES"
  "TEST-REQ-CBR-009-STRING-TWO-REUSED-WORKERS-SHARE-BUFFER-WITH-DISTINCT-RAW-AND-TEXT-WINDOWS")
 :limits (:six-preregistered-semantic-mutations :two-extensions-declared-before-run
          :one-semantic-substitution-per-copy :arity-has-two-coherent-text-fragments
          :compile-all-before-nominal-tests :stop-at-first-nominal-failure
          :no-detection-from-diagnostic-substrings :no-complete-engine-build)
 :mutants
 ((:id "major-permissive" :preregistered t :semantic-substitutions 1 :text-fragments 1
   :meaning "Wrong majors are reinterpreted as MT2, preserving the declared returned-major domain."
   :expected-first-test "TEST-REQ-CBR-009-STRING-TYPE-PRECEDES-FIT-FOR-EVERY-OTHER-MAJOR"
   :fragments
   ((:before "(unless (typep major '(integer 2 3))
        (error 'corruption-detected :reason :cbor-string-type :offset begin))"
     :after "(unless (typep major '(integer 2 3))
        (setf major 2))")))
  (:id "skip-utf8" :preregistered t :semantic-substitutions 1 :text-fragments 1
   :meaning "MT3 skips payload UTF-8 validation; all header and fit checks remain."
   :expected-first-test "TEST-REQ-CBR-009-STRING-UTF8-REASONS-AND-ABSOLUTE-PAYLOAD-OFFSETS"
   :fragments
   ((:before "(when (= major 3)
          (let ((count (arcdocdb.utf8:verifica-utf8 bytes payload-start next :max-bytes low)))
            (unless (<= count low)
              (error 'invariant-violation :reason :cbor-string-read-count :offset payload-start))))"
     :after "(when (= major 3) nil)")))
  (:id "next-is-end" :preregistered t :semantic-substitutions 1 :text-fragments 1
   :meaning "The returned NEXT skips unread tail, while internal payload checks retain their real cursor."
   :expected-first-test "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS"
   :fragments ((:before "(values major payload-start next)" :after "(values major payload-start limit)")))
  (:id "ignore-requested-budget" :preregistered t :semantic-substitutions 1 :text-fragments 1
   :meaning "The full-window comparison uses the hard implementation cap instead of requested MAX-BYTES."
   :expected-first-test "TEST-REQ-CBR-009-STRING-BYTE-LIMIT-DOMAIN-AND-PREFLIGHT-PRECEDENCES"
   :fragments ((:before "(when (> span max-bytes)" :after "(when (> span +cbor-scan-max-bytes+)")))
  (:id "start-is-zero" :preregistered t :semantic-substitutions 1 :text-fragments 1
   :meaning "The decoder begins at physical zero after validating the caller range."
   :expected-first-test "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS"
   :fragments ((:before "(begin (the index start))" :after "(begin 0)")))
  (:id "extra-fourth-nil" :preregistered t :semantic-substitutions 1 :text-fragments 2
   :meaning "One extra NIL value is returned; FTYPE is changed coherently only in this private mutant."
   :expected-first-test "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS"
   :fragments
   ((:before "(values major payload-start next)" :after "(values major payload-start next nil)")
    (:before "(values (integer 2 3) index index &optional)"
     :after "(values (integer 2 3) index index null &optional)")))
  (:id "skip-header-minimality" :preregistered nil :semantic-substitutions 1 :text-fragments 1
   :meaning "The syntax-only header reader replaces the minimum-header reader; the form guard remains."
   :expected-first-test "TEST-REQ-CBR-009-STRING-CONCATENATION-AND-ZERO-LENGTH-PAYLOAD-FRONTIERS"
   :fragments ((:before "(leggi-header-cbor-minimo bytes begin limit)"
                :after "(leggi-header-cbor bytes begin limit)")))
  (:id "ignore-high-length-word" :preregistered nil :semantic-substitutions 1 :text-fragments 1
   :meaning "Every u32 HIGH satisfies the guard, so payload fit uses LOW alone."
   :expected-first-test "TEST-REQ-CBR-009-STRING-U64-LENGTH-AND-LOW-WORD-FIT-BEFORE-PAYLOAD"
   :fragments ((:before "(unless (zerop high)" :after "(unless (<= high #xffffffff)")))))
