;;;; Preferenza locale delle testate complete; non valida il profilo dell'item.
;;; OWNER: buffer immutabile del chiamante; parole e cursori locali.
;;; SHARED: sola lettura, nessuna scrittura/attesa tra Serie (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function ((unsigned-byte 5) u32 u32) (values boolean &optional))
                argomento-minimo-cbor-p))
(defun argomento-minimo-cbor-p (ai high low)
  "Pre: complete MT0..6 header, AI0..27, and separate words. Post: T if the argument
uses the minimum width, without reconstructing a u64. No payload read.
INVARIANT-VIOLATION for AI or HIGH incompatible with the declared width."
  (unless (< ai 28)
    (error 'invariant-violation :reason :cbor-minimal-ai))
  (unless (or (= ai 27) (zerop high))
    (error 'invariant-violation :reason :cbor-minimal-words))
  (if (< ai 24) t
      (case ai
        (24 (>= low 24))
        (25 (>= low 256))
        (26 (>= low 65536))
        (27 (not (zerop high)))
        (otherwise (error 'invariant-violation :reason :cbor-minimal-ai)))))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function ((unsigned-byte 5) u32 u32) (values boolean &optional))
                float-accorciabile-header-cbor-p))
(defun float-accorciabile-header-cbor-p (ai high low)
  "Pre: complete MT7 header, AI0..27, and raw words. Post: T only for a
binary32/64 float that can be shortened; simple and binary16 cannot be shortened.
INVARIANT-VIOLATION for AI or HIGH inconsistent with width; no float constructed."
  (unless (< ai 28)
    (error 'invariant-violation :reason :cbor-minimal-ai))
  (unless (or (= ai 27) (zerop high))
    (error 'invariant-violation :reason :cbor-minimal-words))
  (case ai
    ((0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25) nil)
    (26 (binary32-accorciabile-cbor-p low))
    (27 (binary64-accorciabile-cbor-p high low))
    (otherwise (error 'invariant-violation :reason :cbor-minimal-ai))))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t)
                         (values (unsigned-byte 3) (unsigned-byte 5) u32 u32 index
                                 (member :argument) &optional))
                leggi-header-cbor-minimo))
(defun leggi-header-cbor-minimo (buffer start end)
  "Pre: immutable simple u8 BUFFER, half-open span; cold verification by the base reader.
Post: the same six values MAJOR, AI, HIGH, LOW, NEXT, :ARGUMENT, only for a minimal header.
First propagates all reader syntax errors; then CORRUPTION-DETECTED
:cbor-nonminimal at START for indefinite/break, an argument, or a float that can be shortened.
INVARIANT-VIOLATION for inconsistent progress or shape. NaN preserves sign/payload;
no u64/float/AST materialized, no payload, state, waiting, or I/O."
  (multiple-value-bind (major ai high low next form) (leggi-header-cbor buffer start end)
    (unless (and (< start next) (<= next end))
      (error 'invariant-violation :reason :cbor-minimal-progress :offset start))
    (unless (if (eq form :argument) (< ai 28) (= ai 31))
      (error 'invariant-violation :reason :cbor-minimal-form :offset start))
    (unless (eq form :argument)
      (error 'corruption-detected :reason :cbor-nonminimal :offset start))
    (when (if (< major 7)
              (not (argomento-minimo-cbor-p ai high low))
              (float-accorciabile-header-cbor-p ai high low))
      (error 'corruption-detected :reason :cbor-nonminimal :offset start))
    (values major ai high low next :argument)))
