(:SCHEMA-VERSION 1 :KIND :DEVELOPMENT-UNWRAPPED-BUILD :STATUS :FAILED :STDOUT-STDERR "; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/package.lisp\" (written 03 OCT 2026 11:29:31 AM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/package-tmpGHU3ALSV.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/package.lisp\" (written 11 OCT 2026 12:58:03 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/package-tmpAAURSO1.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/conditions.lisp\" (written 09 OCT 2026 06:11:01 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/conditions-tmp5GEXGEG5.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/binary.lisp\" (written 08 OCT 2026 09:38:30 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/binary-tmpAR3FSGEY.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/crc32c.lisp\" (written 08 OCT 2026 09:38:30 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/crc32c-tmpJAIDFZTC.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/record.lisp\" (written 11 OCT 2026 12:58:03 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/record-tmp8V3J6PE9.fasl
; compilation finished in 0:00:00.128
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/batch.lisp\" (written 08 OCT 2026 09:38:30 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/foundation/batch-tmp9V47YWQF.fasl
; compilation finished in 0:00:00.027
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/package.lisp\" (written 11 OCT 2026 01:40:37 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/package-tmp9BN22RMA.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/arithmetic.lisp\" (written 11 OCT 2026 01:40:37 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/hash/arithmetic.lisp
; in: DEFUN READ64
;     (DEFUN ARCDOCDB.HASH64::READ64 (ARCDOCDB.HASH64::BUFFER POSITION)
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
;   Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;               (ASH
;                (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER (+ POSITION 4))
;                32)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::READ64
;         (ARCDOCDB.HASH64::BUFFER POSITION)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
; Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (BLOCK ARCDOCDB.HASH64::READ64
;         (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;                 (ASH (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER #) 32))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROTATE64
;     (DEFUN ARCDOCDB.HASH64::ROTATE64 (ARCDOCDB.HASH64::VALUE COUNT)
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
;   Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                       (ASH ARCDOCDB.HASH64::VALUE (- COUNT 64)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROTATE64
;         (ARCDOCDB.HASH64::VALUE COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
; Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (BLOCK ARCDOCDB.HASH64::ROTATE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                         (ASH ARCDOCDB.HASH64::VALUE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROUND64
;     (DEFUN ARCDOCDB.HASH64::ROUND64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
;   Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (*
;                (ARCDOCDB.HASH64::ROTATE64 (LOGAND ARCDOCDB.HASH64::+MASK64+ #)
;                 31)
;                ARCDOCDB.HASH64::+PRIME1+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROUND64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
; Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (BLOCK ARCDOCDB.HASH64::ROUND64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (* (ARCDOCDB.HASH64::ROTATE64 # 31)
;                    ARCDOCDB.HASH64::+PRIME1+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN MERGE64
;     (DEFUN ARCDOCDB.HASH64::MERGE64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (+
;                (* (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR #)
;                   ARCDOCDB.HASH64::+PRIME1+)
;                ARCDOCDB.HASH64::+PRIME4+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::MERGE64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (BLOCK ARCDOCDB.HASH64::MERGE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (+ (* # ARCDOCDB.HASH64::+PRIME1+) ARCDOCDB.HASH64::+PRIME4+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN AVALANCHE64
;     (DEFUN ARCDOCDB.HASH64::AVALANCHE64 (ARCDOCDB.HASH64::VALUE)
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                 (ASH ARCDOCDB.HASH64::ACCUMULATOR -32))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::AVALANCHE64
;         (ARCDOCDB.HASH64::VALUE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (BLOCK ARCDOCDB.HASH64::AVALANCHE64
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                   (ASH ARCDOCDB.HASH64::ACCUMULATOR -32)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/arithmetic-tmp1CXFJSK9.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/blocks.lisp\" (written 11 OCT 2026 01:40:37 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/hash/blocks.lisp
; in: DEFUN HASH-BLOCKS
;     (= POSITION (+ ARCDOCDB.HASH64::START (* 32 (ASH ARCDOCDB.HASH64::SIZE -5))))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (DEFUN ARCDOCDB.HASH64::HASH-BLOCKS
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;             ARCDOCDB.HASH64::SEED)
;       #<(SIMPLE-ARRAY CHARACTER
;          (264)) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
;   Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
;   INVARIANT-VIOLATION :hash... {80073D114F}>
;       (UNLESS
;           (AND (>= ARCDOCDB.HASH64::SIZE 32)
;                (<= (+ ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE)
;                    (LENGTH ARCDOCDB.HASH64::BUFFER)))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                :HASH-BLOCK-SPAN))
;       (LET ((ARCDOCDB.HASH64::V1 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V2 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;             (ARCDOCDB.HASH64::V4 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (POSITION ARCDOCDB.HASH64::START))
;         (DECLARE
;          (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;           ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;          (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH ARCDOCDB.HASH64::SIZE -5))
;           (SETF ARCDOCDB.HASH64::V1 #
;                 ARCDOCDB.HASH64::V2 #
;                 ARCDOCDB.HASH64::V3 #
;                 ARCDOCDB.HASH64::V4 #)
;           (INCF POSITION 32))
;         (UNLESS (= POSITION (+ ARCDOCDB.HASH64::START #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-PROGRESS))
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #)
;           (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                     ARCDOCDB.HASH64::V4))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-BLOCKS
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;          ARCDOCDB.HASH64::SEED)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          264) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
; Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
; INVARIANT-VIOLATION :hash... {80073D438F}>
;       (BLOCK ARCDOCDB.HASH64::HASH-BLOCKS
;         (UNLESS (AND (>= ARCDOCDB.HASH64::SIZE 32) (<= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-SPAN))
;         (LET ((ARCDOCDB.HASH64::V1 #)
;               (ARCDOCDB.HASH64::V2 #)
;               (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;               (ARCDOCDB.HASH64::V4 #)
;               (POSITION ARCDOCDB.HASH64::START))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;             ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;            (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 32))
;           (UNLESS (= POSITION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-BLOCK-PROGRESS))
;           (LET (#)
;             (DECLARE #)
;             (SETF #)
;             (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                       ARCDOCDB.HASH64::V4)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN HASH-TAIL
;     (DEFUN ARCDOCDB.HASH64::HASH-TAIL
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;             ARCDOCDB.HASH64::ACCUMULATOR)
;       #<(SIMPLE-ARRAY CHARACTER
;          (252)) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
;   Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
;   INVARIANT-VIOLATION :hash-tail-span... {800797000F}>
;       (UNLESS
;           (AND
;            (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;                (LENGTH ARCDOCDB.HASH64::BUFFER))
;            (<= (- ARCDOCDB.HASH64::END ARCDOCDB.HASH64::START) 31))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :HASH-TAIL-SPAN))
;       (LET ((POSITION ARCDOCDB.HASH64::START)
;             (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;         (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                  (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH # -3))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 8))
;         (WHEN (<= 4 (- ARCDOCDB.HASH64::END POSITION))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 4))
;         (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;               DO (SETF ARCDOCDB.HASH64::VALUE #
;                        ARCDOCDB.HASH64::VALUE #) (INCF POSITION))
;         (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-PROGRESS))
;         ARCDOCDB.HASH64::VALUE))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-TAIL
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;          ARCDOCDB.HASH64::ACCUMULATOR)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          252) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
; Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
; INVARIANT-VIOLATION :hash-tail-span... {80079706BF}>
;       (BLOCK ARCDOCDB.HASH64::HASH-TAIL
;         (UNLESS
;             (AND (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END #) (<= # 31))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-SPAN))
;         (LET ((POSITION ARCDOCDB.HASH64::START)
;               (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;           (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                    (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 8))
;           (WHEN (<= 4 #) (SETF #) (INCF POSITION 4))
;           (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;                 DO (SETF #) (INCF POSITION))
;           (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-TAIL-PROGRESS))
;           ARCDOCDB.HASH64::VALUE)))
; 
; note: doing unsigned word to integer coercion (cost 20) from VALUE to \"<return value>\"


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/blocks-tmpX4BRKI0R.fasl
; compilation finished in 0:00:00.028
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/hash64.lisp\" (written 11 OCT 2026 01:40:37 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/hash/hash64.lisp
; in: DEFUN XXH64
;     (ARCDOCDB.HASH64::HASH-BLOCKS ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START
;                                   ARCDOCDB.HASH64::SIZE ARCDOCDB.HASH64::SEED)
; --> BLOCK LET UNLESS IF = 
; ==>
;   1
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/hash/hash64-tmpQ371UGST.fasl
; compilation finished in 0:00:00.033
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/package.lisp\" (written 16 OCT 2026 05:56:02 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/package-tmp2OWI3Q7U.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/utf8.lisp\" (written 16 OCT 2026 05:56:02 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/utf8.lisp
; in: DEFUN LEGGI-SCALARE-UTF8
;     (= ARCDOCDB.UTF8::START ARCDOCDB.UTF8::END)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to open code because: The operands might not be the same type.
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a DOUBLE-FLOAT.
;       The second argument is a T, not a DOUBLE-FLOAT.

;     (ASH ARCDOCDB.UTF8::CP 6)
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -64) (INTEGER 0 0) (INTEGER 64))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -64) (INTEGER 0 0) (INTEGER 64))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR (ASH ARCDOCDB.UTF8::CP 6)
;             (LOGAND (AREF ARCDOCDB.UTF8::BYTES POSITION) 63))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -64) (INTEGER 0 0) (INTEGER 64)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (OR (INTEGER * -64) (INTEGER 0 0) (INTEGER 64)), not a (UNSIGNED-BYTE
;                                                                                       64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN VERIFICA-UTF8
;     (LOOP ARCDOCDB.UTF8::REPEAT ARCDOCDB.UTF8::SPAN
;           DO (WHEN (= ARCDOCDB.UTF8::CURSOR ARCDOCDB.UTF8::LIMIT)
;                (RETURN)) (SETF ARCDOCDB.UTF8::CURSOR
;                                  (ARCDOCDB.UTF8::VERIFICA-CARATTERE-UTF8
;                                   ARCDOCDB.UTF8::BYTES ARCDOCDB.UTF8::CURSOR
;                                   ARCDOCDB.UTF8::LIMIT)) (INCF COUNT) (UNLESS
;                                                                           (<=
;                                                                            COUNT
;                                                                            (-
;                                                                             ARCDOCDB.UTF8::CURSOR
;                                                                             ARCDOCDB.UTF8::BEGIN))
;                                                                         (ERROR
;                                                                          'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;                                                                          :REASON
;                                                                          :UTF8-COUNT
;                                                                          :OFFSET
;                                                                          ARCDOCDB.UTF8::CURSOR)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/utf8-tmp9KKTJMYV.fasl
; compilation finished in 0:00:00.026
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-package.lisp\" (written 16 OCT 2026 05:36:48 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-package-tmpJU0JWO19.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-header.lisp\" (written 09 OCT 2026 10:04:33 AM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-header.lisp
; in: DEFUN LEGGI-INDEFINITO-HEADER-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MAJOR :OFFSET
;            ARCDOCDB.CBOR::START)
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-header-tmpZX2WN8N4.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-minimal.lisp\" (written 09 OCT 2026 05:36:35 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-minimal.lisp
; in: DEFUN BINARY32-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT32-FIELDS)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ALLINEATO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-SHIFT)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-FIELDS)
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-minimal-tmpOU81XRV0.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-minimal.lisp\" (written 09 OCT 2026 05:36:35 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-minimal.lisp
; in: DEFUN ARGOMENTO-MINIMO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN FLOAT-ACCORCIABILE-HEADER-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-HEADER-CBOR-MINIMO
;     (< ARCDOCDB.CBOR::START ARCDOCDB.CBOR::NEXT)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-minimal-tmpY2ML9CFA.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-space.lisp\" (written 09 OCT 2026 12:31:47 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-space.lisp
; in: DEFUN CREA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code

; in: DEFUN AZZERA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-space-tmpX2JYJDQE.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-input.lisp\" (written 09 OCT 2026 12:31:47 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-input.lisp
; in: DEFUN CHECK-INPUT-STRUTTURA-CBOR
;     (> ARCDOCDB.CBOR::SPAN ARCDOCDB.CBOR::MAX-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The second argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-input-tmpOPCILR65.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-stack.lisp\" (written 09 OCT 2026 12:31:47 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-stack.lisp
; in: DEFUN TIPO-FRAME-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-STACK-TOP)
; 
; note: deleting unreachable code

; in: DEFUN INIZIA-FIGLIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-CHILD-KIND)
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-stack-tmpRV9F8A9A.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-items.lisp\" (written 09 OCT 2026 12:31:47 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-items-tmpK2ZAJT4I.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan.lisp\" (written 09 OCT 2026 06:56:54 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan.lisp
; in: DEFUN VERIFICA-STRUTTURA-CBOR-INTERNA
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (WHEN
;                  (ARCDOCDB.CBOR::SVUOTA-FRAME-CBOR ARCDOCDB.CBOR::SCRATCH
;                                                    ARCDOCDB.CBOR::LIMIT)
;                (RETURN)) (ARCDOCDB.CBOR::PASSO-STRUTTURA-CBOR
;                           ARCDOCDB.CBOR::BYTES ARCDOCDB.CBOR::SCRATCH
;                           ARCDOCDB.CBOR::LIMIT ARCDOCDB.CBOR::NODE-LIMIT
;                           ARCDOCDB.CBOR::DEPTH-LIMIT ARCDOCDB.CBOR::MINIMAL))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-tmpUX5S4ADN.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-minimal.lisp\" (written 09 OCT 2026 06:56:54 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-scan-minimal-tmp10401X32.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-write.lisp\" (written 11 OCT 2026 01:08:00 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-write-tmpZ7CBRM0G.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-write.lisp\" (written 11 OCT 2026 02:47:59 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-write.lisp
; in: DEFUN CHECK-SPAN-STRING-CBOR-WRITE
;     (= (+ ARCDOCDB.CBOR::START ARCDOCDB.CBOR::SPAN) ARCDOCDB.CBOR::END)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN CHECK-INPUT-STRING-CBOR-WRITE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-STRING-SELECTION)
; 
; note: deleting unreachable code

; in: DEFUN COPIA-STRINGA-CBOR-WRITE
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (SETF (AREF ARCDOCDB.CBOR::BUFFER ARCDOCDB.CBOR::CURSOR)
;                      (AREF ARCDOCDB.CBOR::SOURCE
;                            ARCDOCDB.CBOR::READ-CURSOR)) (INCF
;                                                          ARCDOCDB.CBOR::CURSOR) (INCF
;                                                                                  ARCDOCDB.CBOR::READ-CURSOR))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN SCRIVI-STRINGA-CBOR-MINIMA
;     (= ARCDOCDB.CBOR::PAYLOAD-START
;        (+ ARCDOCDB.CBOR::BEGIN ARCDOCDB.CBOR::HEADER-SIZE))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-write-tmp9OZEQ0G2.fasl
; compilation finished in 0:00:00.033
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-simple-write.lisp\" (written 11 OCT 2026 04:04:18 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-simple-write.lisp
; in: DEFUN CHECK-INPUT-SIMPLE-CBOR-WRITE
;     (= (+ ARCDOCDB.CBOR::START ARCDOCDB.CBOR::SPAN) ARCDOCDB.CBOR::END)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-simple-write-tmpB2JTL1W9.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-narrow.lisp\" (written 13 OCT 2026 09:44:44 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-narrow-tmpP3BI68WQ.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-write.lisp\" (written 13 OCT 2026 09:44:44 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-write.lisp
; in: DEFUN CHECK-FLOAT-CBOR-RANGE
;     (= (+ ARCDOCDB.CBOR::START ARCDOCDB.CBOR::SPAN) ARCDOCDB.CBOR::END)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN CHECK-FLOAT-CBOR-WORDS
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT-WRITE-AI)
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-float-write-tmpQDARA81Z.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-array-input.lisp\" (written 14 OCT 2026 12:26:28 AM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-array-input-tmpYEMMM7SE.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-array-write.lisp\" (written 14 OCT 2026 12:26:28 AM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-array-write.lisp
; in: DEFUN SCRIVI-ARRAY-CBOR-MINIMO
;     (= ARCDOCDB.CBOR::PAYLOAD-START
;        (+ ARCDOCDB.CBOR::BEGIN ARCDOCDB.CBOR::HEADER-SIZE))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-array-write-tmp73HU0RPK.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-input.lisp\" (written 14 OCT 2026 07:57:15 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-input.lisp
; in: DEFUN CHECK-INPUT-MAPPA-CBOR
;     (= ARCDOCDB.CBOR::ITEMS (* 2 COUNT))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-input-tmpIO5N7K88.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-write.lisp\" (written 14 OCT 2026 07:57:15 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-write.lisp
; in: DEFUN SCRIVI-MAPPA-CBOR-MINIMA
;     (= ARCDOCDB.CBOR::PAYLOAD-START
;        (+ ARCDOCDB.CBOR::BEGIN ARCDOCDB.CBOR::HEADER-SIZE))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-map-write-tmpCM21U60Z.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-input.lisp\" (written 14 OCT 2026 10:36:32 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-input.lisp
; in: DEFUN CHECK-INPUT-TAG-CBOR
;     (< ARCDOCDB.CBOR::MAX-NODES 2)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-input-tmp9DT7SEFG.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-write.lisp\" (written 14 OCT 2026 10:36:32 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-write.lisp
; in: DEFUN SCRIVI-TAG-CBOR-MINIMO
;     (= ARCDOCDB.CBOR::PAYLOAD-START
;        (+ ARCDOCDB.CBOR::BEGIN ARCDOCDB.CBOR::HEADER-SIZE))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-tag-write-tmp8065ESJT.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-item-read.lisp\" (written 15 OCT 2026 08:03:52 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-item-read.lisp
; in: DEFUN LEGGI-ITEM-CBOR-MINIMO
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (WHEN
;                  (ARCDOCDB.CBOR::SVUOTA-FRAME-CBOR ARCDOCDB.CBOR::SCRATCH
;                                                    (ARCDOCDB.CBOR::SPAZIO-CBOR-CURSOR
;                                                     ARCDOCDB.CBOR::SCRATCH))
;                (RETURN)) (ARCDOCDB.CBOR::PASSO-STRUTTURA-CBOR
;                           ARCDOCDB.CBOR::BYTES ARCDOCDB.CBOR::SCRATCH
;                           ARCDOCDB.CBOR::LIMIT ARCDOCDB.CBOR::NODE-LIMIT
;                           ARCDOCDB.CBOR::DEPTH-LIMIT T))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-item-read-tmp7S8Z6FGF.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-read.lisp\" (written 16 OCT 2026 05:36:48 PM):

; file: /Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-read.lisp
; in: DEFUN CHECK-INPUT-STRING-CBOR-READ
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-STRING-READ-SPAN)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-STRINGA-CBOR-MINIMA
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-STRING-READ-FORM :OFFSET ARCDOCDB.CBOR::BEGIN)
; 
; note: deleting unreachable code


; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/codec/cbor-string-read-tmpSIT3QPKP.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-package.lisp\" (written 16 OCT 2026 05:40:43 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-package-tmpE0PA0714.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-constants.lisp\" (written 16 OCT 2026 05:39:27 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-constants-tmpJRWHHVG0.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-input.lisp\" (written 16 OCT 2026 05:39:27 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-input-tmp4WZVROCX.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-write.lisp\" (written 16 OCT 2026 05:39:27 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-write-tmpA0I3UKX8.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-read.lisp\" (written 16 OCT 2026 05:40:43 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/format-read-tmp267Y2N80.fasl
; compilation finished in 0:00:00.048
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-package.lisp\" (written 16 OCT 2026 05:54:37 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-package-tmpOUPE5FSJ.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/unicode-tables.lisp\" (written 16 OCT 2026 05:52:34 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/unicode-tables-tmpIGHCU6ZA.fasl
; compilation finished in 0:00:00.570
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-space.lisp\" (written 16 OCT 2026 05:54:37 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-space-tmpBO0TUGLK.fasl
; compilation finished in 0:00:00.044
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-properties.lisp\" (written 16 OCT 2026 05:59:27 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-properties-tmpIIXPIQNW.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-nfc.lisp\" (written 16 OCT 2026 05:56:02 PM):

; wrote /Users/gpicchiarelli/.cache/common-lisp/sbcl-2.6.9-macosx-arm64/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-nfc-tmpOHM494YR.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-word-context.lisp\" (written 16 OCT 2026 05:59:27 PM):
; 
; caught ERROR:
;   READ error during COMPILE-FILE:
;   
;     unmatched close parenthesis
;   
;       Line: 14, Column: 73, File-Position: 768
;   
;       Stream: #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/Documents/ArcDocDB/src/fulltext/analysis-word-context.lisp\" {8007DBDA23}>

; compilation aborted after 0:00:00.002
Unhandled UIOP/LISP-BUILD:COMPILE-FILE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                                          {8005270483}>:
  COMPILE-FILE-ERROR while
  compiling #<CL-SOURCE-FILE \"arcdocdb\" \"fulltext\" \"analysis-word-context\">

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {8005270483}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {8007E657D3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {8007E657D3}>)
2: (INVOKE-DEBUGGER #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {8007E657D3}>)
3: (ERROR UIOP/LISP-BUILD:COMPILE-FILE-ERROR :CONTEXT-FORMAT \"~/asdf-action::format-action/\" :CONTEXT-ARGUMENTS ((#<ASDF/LISP-ACTION:COMPILE-OP > . #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb\" \"fulltext\" \"analysis-word-context\">)))
4: (UIOP/LISP-BUILD:CHECK-LISP-COMPILE-RESULTS NIL T T \"~/asdf-action::format-action/\" ((#<ASDF/LISP-ACTION:COMPILE-OP > . #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb\" \"fulltext\" \"analysis-word-context\">)))
5: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb\" \"fulltext\" \"analysis-word-context\">)
6: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
7: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb\" \"fulltext\" \"analysis-word-context\">) [fast-method]
8: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8003870423}>) [fast-method]
9: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
10: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8003870423}>) [fast-method]
11: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
12: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\">)
13: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
14: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb\">) [fast-method]
15: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:LOAD-OP \"arcdocdb\")
16: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
17: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb\") [fast-method]
18: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800387025B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
19: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
20: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800387017B}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
21: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb\") [fast-method]
22: (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\")
23: (SB-INT:SIMPLE-EVAL-IN-LEXENV (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\") #<NULL-LEXENV>)
24: (EVAL (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb\"))
25: (SB-IMPL::PROCESS-EVAL/LOAD-OPTIONS ((:EVAL . \"(require :asdf)\") (:EVAL . \"(asdf:load-asd (truename \\\"arcdocdb.asd\\\"))\") (:EVAL . \"(asdf:load-system \\\"arcdocdb\\\")\") (:QUIT)))
26: (SB-IMPL::TOPLEVEL-INIT)
27: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
28: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
29: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
;   caught 1 ERROR condition
;   printed 51 notes
" :LIMITS (:UNWRAPPED :NO-SOURCE-SNAPSHOT :NOT-QUALIFICATION))
