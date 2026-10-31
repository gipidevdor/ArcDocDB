;;;; Sintassi generica locale: nessuna canonicalita, semantica tag o deduplica mappe.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor (unsigned-byte 3)
                          (member :argument :indefinite :break) index)
                         (values null &optional)) check-contesto-cbor))
(defun check-contesto-cbor (space major form lead)
  "Pre: complete header, cursor at lead. Post: definite non-break chunk of the same MT.
INVARIANT-VIOLATION for lead/form; CORRUPTION-DETECTED :cbor-chunk-type at lead,
before node budget. Break checked separately without charging nodes."
  (unless (= lead (spazio-cbor-cursor space))
    (error 'invariant-violation :reason :cbor-context-cursor))
  (when (and (eq form :break) (/= major 7))
    (error 'invariant-violation :reason :cbor-context-form))
  (let ((kind (tipo-frame-cbor space)))
    (when (and (>= kind 5) (not (eq form :break)))
      (unless (and (eq form :argument) (= major (- kind 3)))
        (error 'corruption-detected :reason :cbor-chunk-type :offset lead))))
  nil)

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor index) (values null &optional)) chiudi-break-cbor))
(defun chiudi-break-cbor (space lead)
  "Pre: complete break header. Post: one indefinite frame closed, no node.
CORRUPTION-DETECTED in order tag-break, break, map-value at lead;
INVARIANT-VIOLATION for inconsistent internal cursor."
  (unless (= lead (spazio-cbor-cursor space))
    (error 'invariant-violation :reason :cbor-break-cursor))
  (when (spazio-cbor-pending-tag space)
    (error 'corruption-detected :reason :cbor-tag-break :offset lead))
  (let ((kind (tipo-frame-cbor space)))
    (unless (<= 3 kind 6)
      (error 'corruption-detected :reason :cbor-break :offset lead))
    (when (and (= kind 4)
               (plusp (aref (spazio-cbor-remaining space) (spazio-cbor-top space))))
      (error 'corruption-detected :reason :cbor-map-value :offset lead))
    (depila-frame-cbor space))
  nil)

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor (integer 1 16777216) index)
                         (values null &optional)) conta-nodo-cbor))
(defun conta-nodo-cbor (space max-nodes lead)
  "Pre: valid header and context, non-break. Post: one node added within MAX-NODES.
RESOURCE-EXHAUSTED :cbor-node-budget at lead; INVARIANT-VIOLATION for cursor/count."
  (unless (= lead (spazio-cbor-cursor space))
    (error 'invariant-violation :reason :cbor-node-cursor))
  (unless (<= (spazio-cbor-nodes space) max-nodes)
    (error 'invariant-violation :reason :cbor-node-count))
  (when (>= (spazio-cbor-nodes space) max-nodes)
    (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-node-budget :offset lead))
  (incf (spazio-cbor-nodes space))
  nil)

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor (member 4 5) u32 u32 index index
                          (member :argument :indefinite) (integer 0 100) index)
                         (values null &optional)) apri-contenitore-cbor))
(defun apri-contenitore-cbor (space major high low next end form max-depth lead)
  "Pre: MT4/5 and complete header. Post: frame and depth added, even if empty.
Depth-budget at lead precedes count-fit; map arity checked before 2*N.
CORRUPTION-DETECTED :cbor-truncated at END; INVARIANT-VIOLATION for range/cursor."
  (unless (<= next end)
    (error 'invariant-violation :reason :cbor-container-range))
  (unless (= lead (spazio-cbor-cursor space))
    (error 'invariant-violation :reason :cbor-container-cursor))
  (when (>= (spazio-cbor-depth space) max-depth)
    (error 'arcdocdb.conditions:resource-exhausted :reason :cbor-depth-budget :offset lead))
  (let ((kind-offset (- major 4)))
    (declare (type (integer 0 1) kind-offset))
    (if (eq form :indefinite)
        (empila-frame-cbor space (+ 3 kind-offset) 0)
        (let ((minimum (if (= major 4) (- end next) (floor (- end next) 2))))
          (declare (type index minimum))
          (unless (and (zerop high) (<= low minimum))
            (error 'corruption-detected :reason :cbor-truncated :offset end))
          (empila-frame-cbor space (+ 1 kind-offset)
                            (if (= major 4) low (* 2 low))))))
  (setf (spazio-cbor-cursor space) next)
  nil)

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets spazio-cbor (member 2 3) u32 u32 index index
                          (member :argument :indefinite))
                         (values null &optional)) verifica-stringa-cbor))
(defun verifica-stringa-cbor (buffer space major high low next end form)
  "Pre: MT2/3 header and admitted context. Post: payload within span or indefinite frame.
CORRUPTION-DETECTED :cbor-truncated at END before payload; propagates UTF8 reasons
with absolute offsets, checking each chunk separately; range/progress invariants."
  (unless (<= next end (length buffer))
    (error 'invariant-violation :reason :cbor-string-range))
  (unless (< (spazio-cbor-cursor space) next)
    (error 'invariant-violation :reason :cbor-string-progress))
  (if (eq form :indefinite)
      (progn (empila-frame-cbor space (if (= major 2) 5 6) 0)
             (setf (spazio-cbor-cursor space) next))
      (progn
        (unless (and (zerop high) (<= low (- end next)))
          (error 'corruption-detected :reason :cbor-truncated :offset end))
        (let ((limit (+ next low)))
          (declare (type index limit))
          (when (= major 3)
            (let ((scalars (arcdocdb.utf8:verifica-utf8 buffer next limit)))
              (unless (<= scalars low)
                (error 'invariant-violation :reason :cbor-utf8-count))))
          (setf (spazio-cbor-cursor space) limit))))
  nil)

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets spazio-cbor (unsigned-byte 3) u32 u32 index index
                          (member :argument :indefinite) (integer 0 100) index)
                         (values null &optional)) tratta-item-cbor))
(defun tratta-item-cbor (buffer space major high low next end form max-depth lead)
  "Pre: node charged, valid header/context. Post: cursor advances and child consumed
only for non-tag terminal; tags retain pending without a frame.
Propagates payload/depth/UTF8 rejections; INVARIANT-VIOLATION for range/lead/major."
  (unless (<= next end (length buffer))
    (error 'invariant-violation :reason :cbor-item-range))
  (unless (= lead (spazio-cbor-cursor space))
    (error 'invariant-violation :reason :cbor-item-cursor))
  (unless (= major 6)
    (setf (spazio-cbor-pending-tag space) nil)
    (inizia-figlio-cbor space))
  (case major
    (6 (setf (spazio-cbor-pending-tag space) t (spazio-cbor-cursor space) next))
    ((0 1 7) (setf (spazio-cbor-cursor space) next))
    ((2 3) (verifica-stringa-cbor buffer space major high low next end form))
    ((4 5) (apri-contenitore-cbor space major high low next end form max-depth lead))
    (otherwise (error 'invariant-violation :reason :cbor-item-major)))
  nil)
