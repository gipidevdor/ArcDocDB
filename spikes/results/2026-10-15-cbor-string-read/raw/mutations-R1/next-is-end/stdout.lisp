(:COMPILED-COUNT 38 :CONDITION-TYPE #A((12) BASE-CHAR . "SIMPLE-ERROR")
 :DIAGNOSTIC
 #A((288) BASE-CHAR . "Asserzione fallita: (EQUAL
                     (LIST ARCDOCDB.CBOR.STRING.READ.TESTS::MAJOR
                           ARCDOCDB.CBOR.STRING.READ.TESTS::PAYLOAD
                           ARCDOCDB.CBOR.STRING.READ.TESTS::NEXT)
                     ARCDOCDB.CBOR.STRING.READ.TESTS::ACTUAL)")
 :EXPECTED-TEST-COUNT 17 :EXPECTED-COMPILED-COUNT 38 :SCHEMA-VERSION 1 :KIND
 :CBOR-STRING-READ-MUTATION-CHILD :PHASE :TEST-FAILED :COMPILATION-COMPLETED T
 :TESTS-COMPLETED NIL :COMPILED-FILES
 ("src/package.lisp" "src/foundation/package.lisp"
  "src/foundation/conditions.lisp" "src/foundation/binary.lisp"
  "src/foundation/crc32c.lisp" "src/foundation/record.lisp"
  "src/foundation/batch.lisp" "src/codec/package.lisp" "src/codec/utf8.lisp"
  "src/codec/cbor-package.lisp" "src/codec/cbor-header.lisp"
  "src/codec/cbor-float-minimal.lisp" "src/codec/cbor-minimal.lisp"
  "src/codec/cbor-space.lisp" "src/codec/cbor-scan-input.lisp"
  "src/codec/cbor-scan-stack.lisp" "src/codec/cbor-scan-items.lisp"
  "src/codec/cbor-scan.lisp" "src/codec/cbor-scan-minimal.lisp"
  "src/codec/cbor-write.lisp" "src/codec/cbor-string-write.lisp"
  "src/codec/cbor-simple-write.lisp" "src/codec/cbor-float-narrow.lisp"
  "src/codec/cbor-float-write.lisp" "src/codec/cbor-array-input.lisp"
  "src/codec/cbor-array-write.lisp" "src/codec/cbor-map-input.lisp"
  "src/codec/cbor-map-write.lisp" "src/codec/cbor-tag-input.lisp"
  "src/codec/cbor-tag-write.lisp" "src/codec/cbor-item-read.lisp"
  "src/codec/cbor-string-read.lisp" "tests/foundation/support.lisp"
  "tests/codec/cbor-support.lisp" "tests/codec/cbor-structure-support.lisp"
  "tests/codec/cbor-string-read-support.lisp"
  "tests/codec/cbor-string-read.lisp"
  "tests/codec/cbor-string-read-threads.lisp")
 :TESTS-PASSED NIL :FAILED-TEST
 "TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS")
