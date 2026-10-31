;;;; Sintassi locale della testata CBOR, RFC 8949 sezioni 3 e 3.3.
;;; OWNER: chiamante; BUFFER resta immutabile per l'intera lettura.
;;; SHARED: sola lettura del buffer; parole e cursori locali a ogni chiamata.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t) (values index &optional)) check-header-cbor-range))
(defun check-header-cbor-range (buffer start end)
  "Pre: unverified external arguments. Post: index END and nonempty span.
INVALID-ARGUMENT :cbor-range for invalid buffer/range, without offset;
CORRUPTION-DETECTED :cbor-truncated at offset END for a valid empty span.
No bytes read; no implicit document limit on the span."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason :cbor-range))
  (when (= start end)
    (error 'corruption-detected :reason :cbor-truncated :offset end))
  end)

;;; REQ: REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index (member 1 2 4 8))
                         (values u32 u32 index &optional)) leggi-argomento-header-cbor))
(defun leggi-argomento-header-cbor (buffer start end width)
  "Pre: WIDTH 1/2/4/8 and span after the lead. Post: two BE u32 words and increasing end;
HIGH zero through four bytes, otherwise the first four bytes in HIGH.
INVARIANT-VIOLATION for bounds/progress; CORRUPTION-DETECTED :cbor-truncated
at offset END before reading if the entire width does not fit. At most eight steps."
  (unless (<= start end (length buffer))
    (error 'invariant-violation :reason :cbor-argument-range :offset start))
  (when (> width (- end start))
    (error 'corruption-detected :reason :cbor-truncated :offset end))
  (let ((high 0) (low 0) (high-bytes (max 0 (- width 4))) (next (+ start width)))
    (declare (type u32 high low) (type (integer 0 4) high-bytes) (type index next))
    (dotimes (i width)
      (let ((octet (aref buffer (+ start i))))
        (declare (type u8 octet))
        (if (< i high-bytes)
            (setf high (logior (ash high 8) octet))
            (setf low (logior (ash low 8) octet)))))
    (unless (and (< start next) (<= next end))
      (error 'invariant-violation :reason :cbor-argument-progress :offset start))
    (values high low next)))

;;; REQ: REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index (unsigned-byte 3) (unsigned-byte 5))
                         (values (unsigned-byte 3) (unsigned-byte 5) u32 u32 index
                                 (member :indefinite :break) &optional))
                leggi-indefinito-header-cbor))
(defun leggi-indefinito-header-cbor (buffer start end major ai)
  "Pre: lead present and AI31. Post: six values with zero words and end START+1;
MT2..5 :indefinite, MT7 :break, without validating their structural context.
INVARIANT-VIOLATION for internal bounds/AI; CORRUPTION-DETECTED :cbor-indefinite
at offset START for MT0/1/6. No additional bytes read."
  (unless (and (< start end) (<= end (length buffer)))
    (error 'invariant-violation :reason :cbor-indefinite-range :offset start))
  (unless (= ai 31)
    (error 'invariant-violation :reason :cbor-indefinite-context :offset start))
  (case major
    ((0 1 6) (error 'corruption-detected :reason :cbor-indefinite :offset start))
    ((2 3 4 5) (values major ai 0 0 (the index (1+ start)) :indefinite))
    (7 (values major ai 0 0 (the index (1+ start)) :break))
    (otherwise (error 'invariant-violation :reason :cbor-major :offset start))))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t)
                         (values (unsigned-byte 3) (unsigned-byte 5) u32 u32 index
                                 (member :argument :indefinite :break) &optional))
                leggi-header-cbor))
(defun leggi-header-cbor (buffer start end)
  "Pre: immutable simple u8 BUFFER and half-open span, checked even on cold entry.
Post: six values MAJOR, AI, HIGH, LOW, NEXT, FORM after only the complete header;
arguments and float bits preserved, without materializing a u64 integer or float.
Propagates range/truncation errors; CORRUPTION-DETECTED :cbor-reserved on the lead,
:cbor-indefinite for illegal AI31, :cbor-simple on the second byte F8<32;
INVARIANT-VIOLATION for progress. At most nine bytes, no payload or structure
validated; nonminimal forms allowed, no canonical policy, tags, UTF-8, or depth."
  (let ((limit (check-header-cbor-range buffer start end)))
    (declare (type index limit))
    (let* ((bytes (the octets buffer)) (cursor (the index start))
           (lead (aref bytes cursor)) (major (ldb (byte 3 5) lead))
           (ai (ldb (byte 5 0) lead)))
      (declare (type octets bytes) (type index cursor) (type u8 lead)
               (type (unsigned-byte 3) major) (type (unsigned-byte 5) ai))
      (when (<= 28 ai 30)
        (error 'corruption-detected :reason :cbor-reserved :offset cursor))
      (when (= ai 31)
        (return-from leggi-header-cbor
          (leggi-indefinito-header-cbor bytes cursor limit major ai)))
      (let ((width (if (< ai 24) 0 (ash 1 (- ai 24)))))
        (declare (type (member 0 1 2 4 8) width))
        (multiple-value-bind (high low next)
            (if (zerop width) (values 0 ai (the index (1+ cursor)))
                (leggi-argomento-header-cbor bytes (1+ cursor) limit width))
          (when (and (= major 7) (= ai 24) (< low 32))
            (error 'corruption-detected :reason :cbor-simple :offset (1+ cursor)))
          (unless (and (< cursor next) (<= next limit))
            (error 'invariant-violation :reason :cbor-header-progress :offset cursor))
          (values major ai high low next :argument))))))
