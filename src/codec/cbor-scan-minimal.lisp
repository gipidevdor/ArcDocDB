;;;; Un item strutturale/UTF8 con sole testate minime, un solo attraversamento.
;;; OWNER: buffer immutabile e scratch esclusivo del chiamante, privato di ogni worker.
;;; SHARED: nessuna scrittura, attesa o I/O tra Serie (INV-P6); nessun thread creato.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index (integer 0 100) index &optional))
                verifica-struttura-cbor-minima))
(defun verifica-struttura-cbor-minima (buffer start end space
                                      &key (max-bytes +cbor-scan-max-bytes+)
                                        (max-nodes +cbor-scan-max-bytes+)
                                        (max-depth +cbor-scan-max-depth+))
  "Pre: immutable simple u8, half-open span, exclusive scratch, and verified budgets.
Post: exactly NODES, array/map-only peak, END for exactly one item with minimal headers.
Propagates header syntax first, then :cbor-nonminimal on the lead before context,
nodes, depth, or payload/UTF8; completed root checks :cbor-trailing without reading tail.
Preflight INVALID-ARGUMENT/RESOURCE-EXHAUSTED without workspace mutation; reset before
the single traversal, scratch reusable after runtime error. Also propagates
CORRUPTION-DETECTED and INVARIANT-VIOLATION; no tag semantics, map ordering, or deduplication.
Immutable buffer, float/u64 as words only; bounded work, no waiting/I/O."
  (verifica-struttura-cbor-interna buffer start end space max-bytes max-nodes max-depth t))
