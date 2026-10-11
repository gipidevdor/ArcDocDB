(:CASE #A((16) BASE-CHAR . "mutants-survived") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :CBOR-WRITE-MUTATIONS :STATUS :OK :WORKER-ERRORS 0
  :SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-BEFORE
  ((:FILE "fixture" :MD5 "fixture")) :SOURCE-FINGERPRINTS-AFTER
  ((:FILE "fixture" :MD5 "fixture")) :BASELINE
  (:STATUS :OK :RESULT :OK :EXIT-CODE 0 :SIGNAL NIL) :TARGETS
  ((:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "inline-23-nonminimal"
    :BEFORE "(< low 24)" :AFTER "(< low 23)")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "u8-255-nonminimal" :BEFORE
    "(< low 256)" :AFTER "(< low 255)")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "u16-65535-nonminimal"
    :BEFORE "(< low 65536)" :AFTER "(< low 65535)")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "word-little-endian" :BEFORE
    "(byte 8 (* 8 (- width i 1)))" :AFTER "(byte 8 (* 8 i))")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "u64-high-written-low"
    :BEFORE "(scrivi-parola-header-cbor bytes cursor next hi 4)" :AFTER
    "(scrivi-parola-header-cbor bytes cursor next lo 4)")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "major-shift-four" :BEFORE
    "(logior (ash mt 5) ai)" :AFTER "(logior (ash mt 4) ai)")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "physical-capacity" :BEFORE
    "(when (> size (- limit begin))" :AFTER
    "(when (> size (- (length bytes) begin))")
   (:SOURCE-FILE "src/codec/cbor-write.lisp" :NAME "returned-next-minus-one"
    :BEFORE "        next))))" :AFTER "        (1- next)))))"))
  :MUTANTS
  ((:NAME "inline-23-nonminimal" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :SURVIVED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "u8-255-nonminimal" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "u16-65535-nonminimal" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "word-little-endian" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "u64-high-written-low" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "major-shift-four" :SOURCE-FILE "src/codec/cbor-write.lisp" :DETECTED
    T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "physical-capacity" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL)
   (:NAME "returned-next-minus-one" :SOURCE-FILE "src/codec/cbor-write.lisp"
    :DETECTED T :RESULT :DETECTED :EXIT-CODE 1 :SIGNAL NIL))))
