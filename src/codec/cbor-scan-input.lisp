;;;; Preflight senza byte letti e senza mutazioni dello scratch.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t) (values null &optional)) check-limiti-struttura-cbor))
(defun check-limiti-struttura-cbor (max-bytes max-nodes max-depth)
  "Pre: external budgets. Post: bytes 0..16 MiB, nodes 1..16 MiB, depth 0..100.
INVALID-ARGUMENT in order byte-limit, node-limit, depth-limit; NIL offset.
Numeric node default is a kernel configuration, not a CBOR profile."
  (unless (and (typep max-bytes 'index) (<= max-bytes +cbor-scan-max-bytes+))
    (error 'invalid-argument :reason :cbor-byte-limit))
  (unless (and (typep max-nodes 'index) (<= 1 max-nodes +cbor-scan-max-bytes+))
    (error 'invalid-argument :reason :cbor-node-limit))
  (unless (and (typep max-depth 'index) (<= max-depth +cbor-scan-max-depth+))
    (error 'invalid-argument :reason :cbor-depth-limit))
  nil)

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t t t) (values index &optional))
                check-input-struttura-cbor))
(defun check-input-struttura-cbor (buffer start end space max-bytes max-nodes max-depth)
  "Pre: unverified cold input. Post: index span within budget, even if empty.
Order: range, workspace, alias, limits, byte-budget. INVALID-ARGUMENT or
RESOURCE-EXHAUSTED with NIL offset, before byte reads or workspace writes."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason :cbor-range))
  (unless (typep space 'spazio-cbor)
    (error 'invalid-argument :reason :cbor-workspace))
  (when (eq buffer (spazio-cbor-kinds space))
    (error 'invalid-argument :reason :cbor-alias))
  (check-limiti-struttura-cbor max-bytes max-nodes max-depth)
  (let ((span (- end start)))
    (declare (type index span))
    (when (> span max-bytes)
      (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-byte-budget))
    span))
