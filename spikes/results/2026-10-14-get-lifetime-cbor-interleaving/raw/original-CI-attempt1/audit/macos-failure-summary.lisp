(:KIND :CI-FAILURE-OBSERVATION :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY
 :STABLE :COMMIT "92dc4aa0312b6cc1df37e202f414b75742d6fc1c" :COMMAND
 (#A((60) BASE-CHAR
     . "/Applications/Xcode_26.6.app/Contents/Developer/usr/bin/make")
  #A((10) BASE-CHAR . "check-core"))
 :STDOUT-TAIL
 "usati, 16384 item, sink 2115584/2148352, overlap 3777 tick (1000000 tick/s); nessuna inferenza su core/scaling.
  CBOR float write: onda1, 2 worker riusati, 16384 item, sink 2115584/2148352, overlap 2738 tick (1000000 tick/s); nessuna inferenza su core/scaling.
ok    TEST-REQ-CBR-004-FLOAT-WRITE-TWO-REUSED-WORKERS-IMMUTABLE-PLANS
18 test della scrittura dei float CBOR superati.
ok    TEST-REQ-CBR-005-ARRAY-EMPTY-SCALAR-AND-FIVE-LITERAL-CHILDREN
ok    TEST-REQ-CBR-005-ARRAY-COUNT-WIDTH-BOUNDARIES-AND-MINIMAL-HEADER
ok    TEST-REQ-CBR-005-ARRAY-NESTED-TAG-MAP-TEXT-AND-RAW-FLOAT-PREFERENCE
ok    TEST-REQ-CBR-005-ARRAY-CONCATENATION-NEXT-AND-REUSED-SPACE
ok    TEST-REQ-CBR-005-ARRAY-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING
ok    TEST-REQ-CBR-005-ARRAY-SOURCE-TYPE-RANGE-AND-BACKING-ARRAY-INTACT
ok    TEST-REQ-CBR-005-ARRAY-TABLE-TYPE-AND-COUNT-DOMAINS
ok    TEST-REQ-CBR-005-ARRAY-WORKSPACE-TYPE-AND-ALL-SCRATCH-ALIASES-EVEN-EMPTY
ok    TEST-REQ-CBR-005-ARRAY-CONFIGURED-LIMITS-AND-EMPTY-ROOT-MINIMUM
ok    TEST-REQ-CBR-005-ARRAY-STRICT-ENTRY-ORDER-BOUNDS-LAST-AND-UNREAD-TAIL
ok    TEST-REQ-CBR-005-ARRAY-ALL-PREFLIGHT-PHASE-PRECEDENCES
ok    TEST-REQ-CBR-005-ARRAY-OVERLAP-ENTIRE-FOOTPRINT-TOUCHING-AND-EMPTY
ok    TEST-REQ-CBR-005-ARRAY-FULL-BYTE-BUDGET-EXACT-16MIB-AND-ONE-OVER
ok    TEST-REQ-CBR-005-ARRAY-ROOT-TAG-NODE-ACCOUNTING-AND-EXHAUSTED-RESIDUE
ok    TEST-REQ-CBR-005-ARRAY-ROOT-DEPTH-SCALARS-TAGS-AND-99-100-CHILD-CONTAINERS
ok    TEST-REQ-CBR-005-ARRAY-CHILD-ERRORS-ABSOLUTE-OFFSETS-AND-LEFT-TO-RIGHT
ok    TEST-REQ-CBR-005-ARRAY-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS
ok    TEST-REQ-CBR-005-ARRAY-SCRATCH-LAST-CHILD-AND-ZERO-COUNT-NO-RESET
  CBOR array fuzz: seed41525235, 1024 casi, 512 successi e 64 ciascuno capacita/byte/entry/nodi/profondita/parse/source-range/count.
ok    TEST-REQ-CBR-005-ARRAY-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS
  CBOR array: onda0, 2 worker riusati, 4096 composizioni, sink 52178944/75218944, overlap 3920 tick (1000000 tick/s); nessuna inferenza su core/scaling.
  CBOR array: onda1, 2 worker riusati, 4096 composizioni, sink 52178944/75218944, overlap 3014 tick (1000000 tick/s); nessuna inferenza su core/scaling.
ok    TEST-REQ-CBR-005-ARRAY-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS
20 test della composizione degli array CBOR superati.
ok    TEST-REQ-CBR-006-MAP-EMPTY-SCALAR-PAIR-AND-TWO-LITERAL-PAIRS
ok    TEST-REQ-CBR-006-MAP-PAIR-COUNT-WIDTH-BOUNDARIES-AND-MINIMAL-HEADER
ok    TEST-REQ-CBR-006-MAP-NESTED-UTF8-FLOATS-OPAQUE-BYTES-AND-PRESERVED-PAIR-ORDER
ok    TEST-REQ-CBR-006-MAP-CONCATENATION-NEXT-AND-REUSED-SPACE
ok    TEST-REQ-CBR-006-MAP-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING
ok    TEST-REQ-CBR-006-MAP-SOURCE-TYPE-RANGE-AND-BACKING-ARRAY-INTACT
ok    TEST-REQ-CBR-006-MAP-TABLE-TYPE-COUNT-DOMAINS-AND-HALF-LENGTH-BEFORE-MULTIPLICATION
ok    TEST-REQ-CBR-006-MAP-WORKSPACE-TYPE-AND-ALL-SCRATCH-ALIASES-EVEN-EMPTY
ok    TEST-REQ-CBR-006-MAP-CONFIGURED-LIMITS-AND-EMPTY-ROOT-MINIMUM
ok    TEST-REQ-CBR-006-MAP-STRICT-ACTIVE-ENDS-LAST-AND-UNREAD-EVEN-OR-ODD-TAIL
ok    TEST-REQ-CBR-006-MAP-ALL-PREFLIGHT-PHASE-PRECEDENCES
ok    TEST-REQ-CBR-006-MAP-OVERLAP-ENTIRE-FOOTPRINT-TOUCHING-AND-EMPTY
ok    TEST-REQ-CBR-006-MAP-FULL-BYTE-BUDGET-KEY-PLUS-VALUE-EXACT-16MIB-AND-OVER
ok    TEST-REQ-CBR-006-MAP-ROOT-KEY-VALUE-TAG-NODES-AND-ZERO-RESIDUE-BEFORE-RESET
ok    TEST-REQ-CBR-006-MAP-ROOT-DEPTH-SCALARS-TAGS-AND-99-100-CHILD-CONTAINERS
ok    TEST-REQ-CBR-006-MAP-KEY-AND-VALUE-PARSER-ERRORS-ABSOLUTE-AND-LEFT-TO-RIGHT
ok    TEST-REQ-CBR-006-MAP-REUSE-AFTER-VALUE-PARSER-AND-PREFLIGHT-ERRORS
ok    TEST-REQ-CBR-006-MAP-SCRATCH-LAST-VALUE-AND-ZERO-PAIRS-NO-RESET
  CBOR map fuzz: seed4D415035, 1024 casi, 512 successi e 64 ciascuno capacita/byte/entry/nodi/profondita/parse/source-range/count.
ok    TEST-REQ-CBR-006-MAP-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS
  CBOR map: onda0, 2 worker riusati, 4096 composizioni, sink 54677504/77537280, overlap 2625 tick (1000000 tick/s); nessuna inferenza su core/scaling.
  CBOR map: onda1, 2 worker riusati, 4096 composizioni, sink 54677504/77537280, overlap 3020 tick (1000000 tick/s); nessuna inferenza su core/scaling.
ok    TEST-REQ-CBR-006-MAP-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS
20 test della composizione delle mappe CBOR superati.
ok    TEST-REQ-CBR-007-TAG-U32-WORD-WIDTH-BOUNDARIES-AND-ALL-WIRE-SENTINELS
ok    TEST-REQ-CBR-007-TAG-OPAQUE-SCALARS-UTF8-FLOATS-CONTAINERS-AND-PAIR-ORDER
ok    TEST-REQ-CBR-007-TAG-CONCATENATION-NEXT-AND-EXACT-RETURN-ARITY
ok    TEST-REQ-CBR-007-TAG-DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING
ok    TEST-REQ-CBR-007-TAG-SOURCE-TYPE-RANGE-EMPTY-AND-BACKING-ARRAY-INTACT
ok    TEST-REQ-CBR-007-TAG-HIGH-THEN-LOW-DOMAIN-PRECEDENCE-WITHOUT-U64
ok    TEST-REQ-CBR-007-TAG-WORKSPACE-TYPE-AND-BOTH-KINDS-ALIASES
ok    TEST-REQ-CBR-007-TAG-CONFIGURED-LIMITS-AND-ROOT-TWO-NODE-MINIMUM
ok    TEST-REQ-CBR-007-TAG-ALL-PREFLIGHT-PHASE-PRECEDENCES
ok    TEST-REQ-CBR-007-TAG-CAPACITY-ACTIVE-END-AND-COMPLETE-BYTE-BUDGET
ok    TEST-REQ-CBR-007-TAG-OVERLAP-INCLUDING-ONLY-HEADER-AND-TOUCHING-BOUNDARIES
ok    TEST-REQ-CBR-007-TAG-FULL-16MIB-WITH-ONE-AND-NINE-BYTE-HEADER-AND-OVER
ok    TEST-REQ-CBR-007-TAG-ROOT-AND-CONTENT-NODE-RESIDUE-LONG-TAG-CHAINS-NO-FRAME
ok    TEST-REQ-CBR-007-TAG-DEPTH-UNCHANGED-ZERO-SCALARS-AND-100-101-CONTAINERS
ok    TEST-REQ-CBR-007-TAG-PARSER-FAILURES-ABSOLUTE-OFFSET-AND-COMPLETE-SINGLE-ITEM
ok    TEST-REQ-CBR-007-TAG-EVERY-TRUNCATION-NONZERO-SOURCE-START-AND-EXACT-END
ok    TEST-REQ-CBR-007-TAG-SCRATCH-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS
ok    TEST-REQ-CBR-007-TAG-SCRATCH-CONTENT-ONLY-STATISTICS-AFTER-SUCCESS
  CBOR tag fuzz: seed54414737, 1024 casi, 512 successi e 64 ciascuno capacita/byte/high/nodi/profondita/parse/source-range/empty.
ok    TEST-REQ-CBR-007-TAG-FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS
  CBOR tag: onda0, 2 worker riusati, 4096 composizioni, sink 66766848/97310720, overlap 2428 tick (1000000 tick/s); nessuna inferenza su core/scaling.
"
 :STDERR-TAIL "                                  &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (LOGXOR 1 (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::SEED))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-STALE-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-BUILDING-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-FOREIGN-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-CORRUPT-BANK-FAULTS-IMMEDIATELY
;     (* ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT 5)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-MISSING-ROOT-FAULTS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FAULT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS :PRIMARY-INDEX-MISSING-ROOT T)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-INTERNAL-DIGEST-FAULTS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FAULT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS :PRIMARY-HASH-SOURCE-DIGEST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).
While evaluating the form starting at line 23, column 0
  of #P\"/Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\":
Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {8005880033}>:
  Asserzione fallita: (PLUSP ARCDOCDB.CBOR.TAG.WRITE.TESTS::OVERLAP)

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {8005880033}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {80055257E3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {80055257E3}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {80055257E3}>)
3: (ERROR \"Asserzione fallita: ~S\" (PLUSP ARCDOCDB.CBOR.TAG.WRITE.TESTS::OVERLAP))
4: (ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-TAG-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-SOURCE)
5: (ARCDOCDB.CBOR.TAG.WRITE.TESTS:RUN)
6: ((:METHOD ASDF/ACTION:PERFORM (ASDF/LISP-ACTION:TEST-OP (EQL #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">))) #<unused argument> #<unused argument>) [fast-method]
7: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:TEST-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">)
8: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
9: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:TEST-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">) [fast-method]
10: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8005290AB3}>) [fast-method]
11: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
12: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8005290AB3}>) [fast-method]
13: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:TEST-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
14: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:TEST-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\">)
15: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
16: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:TEST-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\">) [fast-method]
17: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:TEST-OP \"arcdocdb\")
18: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
19: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:TEST-OP \"arcdocdb\") [fast-method]
20: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800529091B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
21: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
22: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800529084B}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
23: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:TEST-OP \"arcdocdb\") [fast-method]
24: (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\")
25: (\"top level form\") [toplevel]
26: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
27: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (FUNCTION TREAT-AS-ERROR) (FUNCTION TREAT-AS-ERROR) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\"))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {80052905A3}> 3 NIL T T)
28: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (FUNCTION TREAT-AS-ERROR) (FUNCTION TREAT-AS-ERROR) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\"))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {80052905A3}> 3 NIL)
29: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (FUNCTION TREAT-AS-ERROR) (FUNCTION TREAT-AS-ERROR) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\"))) #<NULL-LEXENV>)
30: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (FUNCTION TREAT-AS-ERROR)) (STYLE-WARNING (FUNCTION TREAT-AS-ERROR))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\")) #<NULL-LEXENV>)
31: (EVAL-TLF (HANDLER-BIND ((WARNING (FUNCTION TREAT-AS-ERROR)) (STYLE-WARNING (FUNCTION TREAT-AS-ERROR))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\")) 3 NIL)
32: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (FUNCTION TREAT-AS-ERROR)) (STYLE-WARNING (FUNCTION TREAT-AS-ERROR))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\")) 3)
33: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (FUNCTION TREAT-AS-ERROR)) (STYLE-WARNING (FUNCTION TREAT-AS-ERROR))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\" :FORCE T) (ASDF/OPERATE:TEST-SYSTEM \"arcdocdb\")) :CURRENT-INDEX 3)
34: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {109980D7B}> #<SB-C::SOURCE-INFO {80052905A3}> SB-C::INPUT-ERROR-IN-LOAD)
35: (SB-INT:LOAD-AS-SOURCE #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\" {8005290353}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
36: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\" {8005290353}> NIL)
37: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {10998084B}> #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\" {8005290353}> NIL #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\" {8005290353}>)
38: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/runner/work/ArcDocDB/ArcDocDB/tools/build.lisp\" {8005290353}> NIL)
39: (LOAD #P\"tools/build.lisp\" :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
40: (SB-IMPL::PROCESS-EVAL/LOAD-OPTIONS ((:LOAD . \"tools/build.lisp\") (:QUIT)))
41: (SB-IMPL::TOPLEVEL-INIT)
42: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
43: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
44: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 1 fatal ERROR condition
;   printed 2138 notes
make[1]: *** [test] Error 1
")
