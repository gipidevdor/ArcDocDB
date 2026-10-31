;;;; Un item esatto, scansione bounded e solo scratch esclusivo del chiamante.
;;; OWNER: buffer immutabile del chiamante; spazio privato di una sola chiamata/worker.
;;; SHARED: nessuna scrittura, attesa o I/O tra Serie (INV-P6); nessun thread creato.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets spazio-cbor index (integer 1 16777216)
                          (integer 0 100) boolean) (values null &optional)) passo-struttura-cbor))
(defun passo-struttura-cbor (buffer space end max-nodes max-depth minimal)
  "Pre: frame to complete, cursor within END, internal boolean MINIMAL.
Post: at least one byte consumed; minimal reader if T, generic if NIL.
Header and minimality before context/budget; generic break excluded from nodes.
INVARIANT-VIOLATION for internal range, shape, or progress; no intended allocation."
  (let ((lead (spazio-cbor-cursor space)))
    (declare (type index lead))
    (unless (<= lead end (length buffer))
      (error 'invariant-violation :reason :cbor-step-range))
    (multiple-value-bind (major ai high low next form)
        (if minimal (leggi-header-cbor-minimo buffer lead end)
            (leggi-header-cbor buffer lead end))
      (unless (if (eq form :argument) (< ai 28) (= ai 31))
        (error 'invariant-violation :reason :cbor-step-form))
      (check-contesto-cbor space major form lead)
      (if (eq form :break)
          (progn (chiudi-break-cbor space lead) (setf (spazio-cbor-cursor space) next))
          (progn (conta-nodo-cbor space max-nodes lead)
                 (tratta-item-cbor buffer space major high low next end form max-depth lead))))
    (unless (and (< lead (spazio-cbor-cursor space)) (<= (spazio-cbor-cursor space) end))
      (error 'invariant-violation :reason :cbor-step-progress :offset lead)))
  nil)

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor index (integer 1 16777216) (integer 0 100))
                         (values index (integer 0 100) index &optional)) risultato-struttura-cbor))
(defun risultato-struttura-cbor (space end max-nodes max-depth)
  "Pre: root complete. Post: nodes/peak/END only after complete verification.
INVARIANT-VIOLATION for end, counts, or residual active state; no decoded data."
  (unless (= (spazio-cbor-cursor space) end)
    (error 'invariant-violation :reason :cbor-result-range))
  (unless (and (<= 1 (spazio-cbor-nodes space) max-nodes)
               (<= (spazio-cbor-peak-depth space) max-depth))
    (error 'invariant-violation :reason :cbor-result-count))
  (unless (and (zerop (spazio-cbor-top space)) (zerop (spazio-cbor-depth space))
               (not (spazio-cbor-pending-tag space)))
    (error 'invariant-violation :reason :cbor-result-state))
  (values (spazio-cbor-nodes space) (spazio-cbor-peak-depth space) end))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t t t boolean)
                         (values index (integer 0 100) index &optional))
                verifica-struttura-cbor-interna))
(defun verifica-struttura-cbor-interna (buffer start end space max-bytes max-nodes max-depth minimal)
  "Pre: cold input, exclusive scratch, wrappers' internal boolean MINIMAL.
Post: NODES, array/map-only peak, END for exactly one item; no buffer mutation.
Rejected preflight does not modify the workspace; a runtime error may leave it dirty,
reusable at the next reset. Propagates INVALID-ARGUMENT, RESOURCE-EXHAUSTED,
CORRUPTION-DETECTED (including absolute UTF8 reasons), INVARIANT-VIOLATION.
T requires minimal headers; NIL preserves generic forms. No tag semantics,
map ordering/deduplication, or decoding. At most SPAN steps and drain102; no waiting/I/O."
  (let ((span (check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)))
    (declare (type index span))
    (unless (<= span +cbor-scan-max-bytes+)
      (error 'invariant-violation :reason :cbor-loop-span))
    (let ((bytes (the octets buffer)) (begin (the index start)) (limit (the index end))
          (scratch (the spazio-cbor space))
          (node-limit (the (integer 1 16777216) max-nodes))
          (depth-limit (the (integer 0 100) max-depth)))
      (azzera-spazio-cbor scratch begin)
      (loop repeat span
            do (when (svuota-frame-cbor scratch limit) (return))
               (passo-struttura-cbor bytes scratch limit node-limit depth-limit minimal))
      (unless (svuota-frame-cbor scratch limit)
        (unless (= (spazio-cbor-cursor scratch) limit)
          (error 'invariant-violation :reason :cbor-loop-bound))
        (leggi-header-cbor bytes limit limit)
        (error 'invariant-violation :reason :cbor-empty-header))
      (risultato-struttura-cbor scratch limit node-limit depth-limit))))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index (integer 0 100) index &optional)) verifica-struttura-cbor))
(defun verifica-struttura-cbor (buffer start end space
                               &key (max-bytes +cbor-scan-max-bytes+)
                                 (max-nodes +cbor-scan-max-bytes+)
                                 (max-depth +cbor-scan-max-depth+))
  "Pre: immutable simple u8, half-open span, exclusive scratch, and verified budgets.
Post: NODES, array/map-only peak, END for exactly one item; immutable buffer.
Preflight without workspace mutation; reset before scanning, reuse after error.
Propagates INVALID-ARGUMENT, RESOURCE-EXHAUSTED, CORRUPTION-DETECTED, and INVARIANT-VIOLATION.
Accepts nonminimal/indefinite headers and raw floats; no tag semantics or canonicality.
Generic wrapper for the single bounded traversal; no waiting/I/O."
  (verifica-struttura-cbor-interna buffer start end space max-bytes max-nodes max-depth nil))
