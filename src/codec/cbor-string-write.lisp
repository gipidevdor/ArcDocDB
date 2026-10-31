;;;; Item MT2/3 definite-length: testata minima e payload, nessun AST.
;;; OWNER: destinazione esclusiva; byte sorgente stabili fino al ritorno.
;;; SHARED: sola lettura della sorgente, nessuna scrittura/attesa tra Serie (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CBR-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t keyword) (values index &optional))
                check-span-string-cbor-write))
(defun check-span-string-cbor-write (buffer start end reason)
  "Pre: array and external bounds; REASON identifies the range. Post: index span.
INVALID-ARGUMENT for type/range, offset NIL, before reading bytes.
INVARIANT-VIOLATION for inconsistent length; span may be empty, no mutation."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason reason))
  (let ((span (- (the index end) (the index start))))
    (declare (type index span))
    (unless (= (+ start span) end)
      (error 'invariant-violation :reason :cbor-string-span))
    span))

;;; REQ: REQ-CBR-002 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t t t t)
                         (values index (member 1 2 3 5) index &optional))
                check-input-string-cbor-write))
(defun check-input-string-cbor-write (buffer start end major source source-start source-end max-bytes)
  "Pre: external arguments. Post: bounded source span, header-size, and item-size.
Order: destination range, major, source range, budget, capacity.
INVALID-ARGUMENT or RESOURCE-EXHAUSTED with offset NIL, before reading/writing bytes;
INVARIANT-VIOLATION for inconsistent internal selection. Budget includes the header."
  (check-span-string-cbor-write buffer start end :cbor-range)
  (unless (typep major '(integer 2 3))
    (error 'invalid-argument :reason :cbor-string-major))
  (let ((span (check-span-string-cbor-write source source-start source-end
                                          :cbor-string-source-range)))
    (declare (type index span))
    (unless (and (typep max-bytes 'index) (<= max-bytes +cbor-scan-max-bytes+))
      (error 'invalid-argument :reason :cbor-string-budget))
    (let ((budget (the index max-bytes)))
      (when (> span budget)
        (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-string-byte-budget))
      (let* ((header-size (the (member 1 2 3 5)
                              (nth-value 1 (seleziona-header-cbor 0 (the u32 span)))))
             (item-size (+ header-size span)))
        (declare (type index item-size))
        (unless (<= 1 header-size item-size)
          (error 'invariant-violation :reason :cbor-string-selection))
        (when (> item-size budget)
          (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-string-byte-budget))
        (when (> item-size (- (the index end) (the index start)))
          (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-string-capacity))
        (values span header-size item-size)))))

;;; REQ: REQ-CBR-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index octets index index)
                         (values null &optional)) check-overlap-string-cbor-write))
(defun check-overlap-string-cbor-write (buffer start next source source-start source-end)
  "Pre: verified spans; NEXT includes header and payload. Post: no overlap.
Disjoint spans in the same array, touching boundaries, and an empty source are allowed.
INVALID-ARGUMENT :cbor-string-overlap, offset NIL; INVARIANT-VIOLATION
for internal bounds. No bytes read or written."
  (unless (<= start next (length buffer))
    (error 'invariant-violation :reason :cbor-string-target-span))
  (unless (<= source-start source-end (length source))
    (error 'invariant-violation :reason :cbor-string-source-span))
  (when (and (eq buffer source) (< source-start source-end)
             (< start source-end) (< source-start next))
    (error 'invalid-argument :reason :cbor-string-overlap))
  nil)

;;; REQ: REQ-CBR-002 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index octets index index)
                         (values index &optional)) copia-stringa-cbor-write))
(defun copia-stringa-cbor-write (buffer target end source start stop)
  "Pre: stable source disjoint from the already verified write footprint.
Post: exact copy into [TARGET,END), returns END; remainder and source span untouched.
INVARIANT-VIOLATION for bounds, length, or progress; at most 16 MiB steps.
No rollback for internal faults; no waiting, I/O, or intended allocation."
  (unless (<= target end (length buffer))
    (error 'invariant-violation :reason :cbor-string-copy-target))
  (unless (<= start stop (length source))
    (error 'invariant-violation :reason :cbor-string-copy-source))
  (let ((span (- stop start)) (cursor target) (read-cursor start))
    (declare (type index span cursor read-cursor))
    (unless (and (<= span +cbor-scan-max-bytes+) (= span (- end target)))
      (error 'invariant-violation :reason :cbor-string-copy-bound))
    (loop repeat span
          do (setf (aref buffer cursor) (aref source read-cursor))
             (incf cursor) (incf read-cursor))
    (unless (and (= cursor end) (= read-cursor stop))
      (error 'invariant-violation :reason :cbor-string-copy-progress))
    cursor))

;;; REQ: REQ-CBR-002 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t t t &key (:max-bytes t))
                         (values index &optional)) scrivi-stringa-cbor-minima))
(defun scrivi-stringa-cbor-minima (buffer start end major source source-start source-end
                                 &key (max-bytes +cbor-scan-max-bytes+))
  "Pre: exclusive destination, stable simple u8 source, half-open spans, MT2/3.
Post: one NEXT only, minimal header and exact payload; external bytes unchanged.
MAX-BYTES 0..16 MiB includes header and payload. Range/major/source/budget,
capacity/overlap/UTF8 preflight before writing; INVALID-ARGUMENT or RESOURCE-EXHAUSTED
with offset NIL, UTF8 errors propagated with absolute source offset.
The same array is allowed only disjoint from the footprint; text counted in bytes.
Internal INVARIANT-VIOLATION without rollback. No atomic/durable publication,
intended allocation, waiting, I/O, AST, or shared state between Serie."
  (multiple-value-bind (span header-size item-size)
      (check-input-string-cbor-write buffer start end major source source-start source-end max-bytes)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (mt (the (integer 2 3) major)) (src (the octets source))
          (source-begin (the index source-start)) (source-limit (the index source-end))
          (next (+ (the index start) item-size)))
      (declare (type index next))
      (check-overlap-string-cbor-write bytes begin next src source-begin source-limit)
      (when (= mt 3)
        (let ((count (arcdocdb.utf8:verifica-utf8 src source-begin source-limit :max-bytes span)))
          (declare (type index count))
          (unless (<= count span)
            (error 'invariant-violation :reason :cbor-string-utf8-count))))
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next mt 0 span)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-string-header-progress))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (declare (type index result))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-string-progress))
          result)))))
