(:CASE #A((21) BASE-CHAR . "mutants-worker-errors") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :CBOR-SIMPLE-WRITE-MUTATIONS :STATUS :OK
  :WORKER-ERRORS 1 :CATALOGUE-SOURCE-BLOB
  "58c7a3a040ec814fae2dfe636f569b5623cba8f0" :CATALOGUE-STATUS :ALIGNED
  :PLANNED-MUTANT-NAMES
  ("reserved-codes-accepted" "one-byte-threshold-22" "wrong-major"
   "wrong-extended-lead" "physical-capacity" "extended-value-zeroed"
   "next-one-too-far" "extra-return-value")
  :SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-BEFORE
  ((:FILE "fixture" :MD5 "fixture")) :SOURCE-FINGERPRINTS-AFTER
  ((:FILE "fixture" :MD5 "fixture")) :BASELINE
  (:STATUS :OK :RESULT :OK :EXIT-CODE 0 :SIGNAL NIL) :TARGETS
  ((:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME
    "reserved-codes-accepted" :BEFORE "(or (integer 0 23) (integer 32 255))"
    :AFTER "(integer 0 255)")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME
    "one-byte-threshold-22" :BEFORE "(size (if (< code 24) 1 2))" :AFTER
    "(size (if (< code 23) 1 2))")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME "wrong-major" :BEFORE
    "(logior #xe0 code)" :AFTER "(logior #xc0 code)")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME "wrong-extended-lead"
    :BEFORE "#xf8" :AFTER "#xf9")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME "physical-capacity"
    :BEFORE "(when (> size span)" :AFTER
    "(when (> size (max span (- (length bytes) begin)))")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME
    "extended-value-zeroed" :BEFORE "(setf (aref bytes cursor) code)" :AFTER
    "(setf (aref bytes cursor) 0)")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME "next-one-too-far"
    :BEFORE "(values next))))" :AFTER "(values (1+ next)))))")
   (:SOURCE-FILE "src/codec/cbor-simple-write.lisp" :NAME "extra-return-value"
    :BEFORE "(declaim (ftype (function (t t t t) (values index &optional))
                scrivi-semplice-cbor-minimo))
(defun scrivi-semplice-cbor-minimo (buffer start end value)
  \"Pre: simple u8 esclusivo, span half-open e codice wire 0..23 oppure 32..255.
Post: un solo NEXT, uno/due byte minimi MT7; fuori [START,NEXT) tutto invariato.
Preflight range/codice/capacita prima di scrivere; INVALID-ARGUMENT oppure
RESOURCE-EXHAUSTED :cbor-simple-capacity, offset NIL e intero array intatto.
INVARIANT-VIOLATION interno senza rollback, fail-stop del proprietario.
Al massimo due byte; nessuna allocazione prevista, attesa, I/O o AST.
Profilo e budget documentale superiori; nessuna pubblicazione atomica/durevole.\"
  (let* ((span (check-input-simple-cbor-write buffer start end value))
         (bytes (the octets buffer)) (begin (the index start))
         (limit (the index end)) (code (the u8 value))
         (size (if (< code 24) 1 2)))
    (declare (type index span) (type (member 1 2) size))
    (when (> size span)
      (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-simple-capacity))
    (let ((next (+ begin size)) (cursor (1+ begin)))
      (declare (type index next cursor))
      (unless (and (< begin next) (<= next limit))
        (error 'invariant-violation :reason :cbor-simple-target-span))
      (setf (aref bytes begin) (if (= size 1) (logior #xe0 code) #xf8))
      (when (= size 2)
        (setf (aref bytes cursor) code)
        (incf cursor))
      (unless (= cursor next)
        (error 'invariant-violation :reason :cbor-simple-progress))
      (values next))))
"
    :AFTER "(declaim (ftype (function (t t t t) (values index null &optional))
                scrivi-semplice-cbor-minimo))
(defun scrivi-semplice-cbor-minimo (buffer start end value)
  \"Pre: simple u8 esclusivo, span half-open e codice wire 0..23 oppure 32..255.
Post: un solo NEXT, uno/due byte minimi MT7; fuori [START,NEXT) tutto invariato.
Preflight range/codice/capacita prima di scrivere; INVALID-ARGUMENT oppure
RESOURCE-EXHAUSTED :cbor-simple-capacity, offset NIL e intero array intatto.
INVARIANT-VIOLATION interno senza rollback, fail-stop del proprietario.
Al massimo due byte; nessuna allocazione prevista, attesa, I/O o AST.
Profilo e budget documentale superiori; nessuna pubblicazione atomica/durevole.\"
  (let* ((span (check-input-simple-cbor-write buffer start end value))
         (bytes (the octets buffer)) (begin (the index start))
         (limit (the index end)) (code (the u8 value))
         (size (if (< code 24) 1 2)))
    (declare (type index span) (type (member 1 2) size))
    (when (> size span)
      (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-simple-capacity))
    (let ((next (+ begin size)) (cursor (1+ begin)))
      (declare (type index next cursor))
      (unless (and (< begin next) (<= next limit))
        (error 'invariant-violation :reason :cbor-simple-target-span))
      (setf (aref bytes begin) (if (= size 1) (logior #xe0 code) #xf8))
      (when (= size 2)
        (setf (aref bytes cursor) code)
        (incf cursor))
      (unless (= cursor next)
        (error 'invariant-violation :reason :cbor-simple-progress))
      (values next nil))))
"))
  :MUTANTS
  ((:NAME "reserved-codes-accepted" :SOURCE-FILE
    "src/codec/cbor-simple-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "one-byte-threshold-22" :SOURCE-FILE
    "src/codec/cbor-simple-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "wrong-major" :SOURCE-FILE "src/codec/cbor-simple-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "wrong-extended-lead" :SOURCE-FILE "src/codec/cbor-simple-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "physical-capacity" :SOURCE-FILE "src/codec/cbor-simple-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "extended-value-zeroed" :SOURCE-FILE
    "src/codec/cbor-simple-write.lisp" :DETECTED T :RESULT :DETECTED :EXIT-CODE
    1 :SIGNAL NIL)
   (:NAME "next-one-too-far" :SOURCE-FILE "src/codec/cbor-simple-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "extra-return-value" :SOURCE-FILE "src/codec/cbor-simple-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL))))
