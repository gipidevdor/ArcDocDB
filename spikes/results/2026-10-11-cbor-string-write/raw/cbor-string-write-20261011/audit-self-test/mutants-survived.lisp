(:CASE #A((16) BASE-CHAR . "mutants-survived") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :CBOR-STRING-WRITE-MUTATIONS :STATUS :OK
  :WORKER-ERRORS 0 :SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-BEFORE
  ((:FILE "fixture" :MD5 "fixture")) :SOURCE-FINGERPRINTS-AFTER
  ((:FILE "fixture" :MD5 "fixture")) :BASELINE
  (:STATUS :OK :RESULT :OK :EXIT-CODE 0 :SIGNAL NIL) :TARGETS
  ((:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "major-two-three-swapped" :BEFORE
    "(scrivi-header-cbor-minimo bytes begin next mt 0 span)" :AFTER
    "(scrivi-header-cbor-minimo bytes begin next (logxor mt 1) 0 span)")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "text-scalar-count-instead-byte-length" :BEFORE
    "(scrivi-header-cbor-minimo bytes begin next mt 0 span)" :AFTER
    "(scrivi-header-cbor-minimo bytes begin next mt 0 (if (= mt 3) (arcdocdb.utf8:verifica-utf8 src source-begin source-limit :max-bytes span) span))")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "last-payload-byte-not-copied" :BEFORE "(loop repeat span" :AFTER
    "(loop repeat (max 0 (1- span))")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME "source-origin-zero"
    :BEFORE "(read-cursor start)" :AFTER "(read-cursor 0)")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "budget-excludes-header" :BEFORE "(when (> item-size budget)" :AFTER
    "(when (> span budget)")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME "physical-capacity"
    :BEFORE "(when (> item-size (- (the index end) (the index start)))" :AFTER
    "(when (> item-size (- (length (the octets buffer)) (the index start)))")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "overlap-ignores-lead-byte" :BEFORE "(< start source-end)" :AFTER
    "(< (1+ start) source-end)")
   (:SOURCE-FILE "src/codec/cbor-string-write.lisp" :NAME
    "nonempty-text-utf8-check-skipped" :BEFORE "(when (= mt 3)" :AFTER
    "(when (and (= mt 3) (zerop span))"))
  :MUTANTS
  ((:NAME "major-two-three-swapped" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :SURVIVED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "text-scalar-count-instead-byte-length" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "last-payload-byte-not-copied" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "source-origin-zero" :SOURCE-FILE "src/codec/cbor-string-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "budget-excludes-header" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "physical-capacity" :SOURCE-FILE "src/codec/cbor-string-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "overlap-ignores-lead-byte" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "nonempty-text-utf8-check-skipped" :SOURCE-FILE
    "src/codec/cbor-string-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL))))
