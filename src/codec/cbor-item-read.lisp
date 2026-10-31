;;;; Primo item minimo entro una finestra bounded; coda non letta.
;;; OWNER: buffer stabile del chiamante; spazio esclusivo della chiamata/worker.
;;; SHARED: sola lettura del buffer; nessuna attesa o scrittura condivisa (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CBR-008 REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index (integer 0 100) index &optional)) leggi-item-cbor-minimo))
(defun leggi-item-cbor-minimo (buffer start end space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  "Pre: stable simple u8, window and budgets verified; private scratch.
Post: exactly NODES, PEAK array/map, absolute NEXT of the first minimal item;
START<NEXT<=END, tail unread, statistics for the item only. MAX-BYTES limits
the entire window, including the tail. Preflight without mutating scratch; reset before
parsing, reuse after error. Propagates INVALID-ARGUMENT, RESOURCE-EXHAUSTED,
CORRUPTION-DETECTED (absolute offsets), and INVARIANT-VIOLATION.
At most SPAN steps and drain102; no AST, tag semantics, waiting, or I/O."
  (let ((span (check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)))
    (declare (type index span))
    (unless (<= span +cbor-scan-max-bytes+)
      (error 'invariant-violation :reason :cbor-item-loop-span))
    (let ((bytes (the octets buffer)) (begin (the index start)) (limit (the index end))
          (scratch (the spazio-cbor space))
          (node-limit (the (integer 1 16777216) max-nodes))
          (depth-limit (the (integer 0 100) max-depth)))
      (azzera-spazio-cbor scratch begin)
      (loop repeat span
            do (when (svuota-frame-cbor scratch (spazio-cbor-cursor scratch)) (return))
               (passo-struttura-cbor bytes scratch limit node-limit depth-limit t))
      (unless (svuota-frame-cbor scratch (spazio-cbor-cursor scratch))
        (unless (= (spazio-cbor-cursor scratch) limit)
          (error 'invariant-violation :reason :cbor-item-loop-bound))
        (leggi-header-cbor bytes limit limit)
        (error 'invariant-violation :reason :cbor-item-empty-header))
      (let ((next (spazio-cbor-cursor scratch)))
        (declare (type index next))
        (unless (< begin next)
          (error 'invariant-violation :reason :cbor-item-read-progress))
        (unless (<= next limit)
          (error 'invariant-violation :reason :cbor-item-read-range))
        (risultato-struttura-cbor scratch next node-limit depth-limit)))))

