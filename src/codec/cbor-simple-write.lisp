;;;; Valori semplici MT7: codice wire minimo, nessun AST o semantica applicativa.
;;; OWNER: destinazione esclusiva del chiamante fino al ritorno.
;;; SHARED: nessuna scrittura, attesa o stato condiviso tra Serie (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CBR-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t) (values index &optional))
                check-input-simple-cbor-write))
(defun check-input-simple-cbor-write (buffer start end value)
  "Pre: external destination and wire code. Post: index span and admitted VALUE.
INVALID-ARGUMENT for range or code 24..31/type, offset NIL, before writing.
INVARIANT-VIOLATION for inconsistent span; no mutation, span may be empty."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason :cbor-range))
  (unless (typep value '(or (integer 0 23) (integer 32 255)))
    (error 'invalid-argument :reason :cbor-simple-value))
  (let ((span (- (the index end) (the index start))))
    (declare (type index span))
    (unless (= (+ start span) end)
      (error 'invariant-violation :reason :cbor-simple-span))
    span))

;;; REQ: REQ-CBR-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t) (values index &optional))
                scrivi-semplice-cbor-minimo))
(defun scrivi-semplice-cbor-minimo (buffer start end value)
  "Pre: exclusive simple u8, half-open span, wire code 0..23 or 32..255.
Post: one NEXT only, one/two minimal MT7 bytes; everything outside [START,NEXT) unchanged.
Range/code/capacity preflight before writing; INVALID-ARGUMENT or
RESOURCE-EXHAUSTED :cbor-simple-capacity, offset NIL and entire array intact.
Internal INVARIANT-VIOLATION without rollback, owner fail-stop.
At most two bytes; no intended allocation, waiting, I/O, or AST.
Profile and document budget belong to upper layers; no atomic/durable publication."
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
