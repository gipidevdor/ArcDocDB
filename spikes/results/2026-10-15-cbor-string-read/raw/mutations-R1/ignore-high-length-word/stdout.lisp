(:COMPILED-COUNT 38 :CONDITION-TYPE #A((12) BASE-CHAR . "SIMPLE-ERROR")
 :DIAGNOSTIC
 #A((67) BASE-CHAR
    . "Asserzione fallita: (NOT ARCDOCDB.CBOR.STRING.READ.TESTS::RETURNED)")
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
 :TESTS-PASSED
 ("TEST-REQ-CBR-009-STRING-LITERAL-EMPTY-UTF8-AND-UNREAD-TAILS"
  "TEST-REQ-CBR-009-STRING-LENGTH-WIDTH-BOUNDARIES-AND-PAYLOAD-OFFSET"
  "TEST-REQ-CBR-009-STRING-RAW-BYTES-NEVER-VALIDATED-AS-UTF8"
  "TEST-REQ-CBR-009-STRING-CONCATENATION-AND-ZERO-LENGTH-PAYLOAD-FRONTIERS"
  "TEST-REQ-CBR-009-STRING-BUFFER-TYPE-RANGE-AND-BACKING-ARRAY-PRESERVED"
  "TEST-REQ-CBR-009-STRING-BYTE-LIMIT-DOMAIN-AND-PREFLIGHT-PRECEDENCES"
  "TEST-REQ-CBR-009-STRING-BUDGET-COVERS-WHOLE-WINDOW-AND-EMPTY-SPAN"
  "TEST-REQ-CBR-009-STRING-TYPE-PRECEDES-FIT-FOR-EVERY-OTHER-MAJOR"
  "TEST-REQ-CBR-009-STRING-HEADER-SYNTAX-AND-MINIMALITY-PRECEDE-TYPE"
  "TEST-REQ-CBR-009-STRING-NONMINIMAL-LENGTHS-BEFORE-FIT-OR-UTF8")
 :FAILED-TEST
 "TEST-REQ-CBR-009-STRING-U64-LENGTH-AND-LOW-WORD-FIT-BEFORE-PAYLOAD")
