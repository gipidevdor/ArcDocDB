;;;; Stack esplicito fisso; tag e chunk definiti non aggiungono frame.
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor) (values (integer 0 6) &optional)) tipo-frame-cbor))
(defun tipo-frame-cbor (space)
  "Pre: active exclusive scratch. Post: kind 0..6 of the current frame.
INVARIANT-VIOLATION for inconsistent top/kind; no mutation."
  (unless (< (spazio-cbor-top space) +cbor-scan-frames+)
    (error 'invariant-violation :reason :cbor-stack-top))
  (let ((kind (aref (spazio-cbor-kinds space) (spazio-cbor-top space))))
    (unless (and (<= kind 6) (eq (zerop kind) (zerop (spazio-cbor-top space))))
      (error 'invariant-violation :reason :cbor-stack-kind))
    kind))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor) (values null &optional)) depila-frame-cbor))
(defun depila-frame-cbor (space)
  "Pre: nonroot frame completed. Post: top decreased, depth only for array/map.
INVARIANT-VIOLATION for root or inconsistent depth count."
  (let ((kind (tipo-frame-cbor space)))
    (when (zerop (spazio-cbor-top space))
      (error 'invariant-violation :reason :cbor-pop-root))
    (when (and (<= 1 kind 4) (zerop (spazio-cbor-depth space)))
      (error 'invariant-violation :reason :cbor-pop-depth))
    (when (<= 1 kind 4) (decf (spazio-cbor-depth space)))
    (decf (spazio-cbor-top space))
    nil))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor (integer 1 6) (integer 0 16777216))
                         (values null &optional)) empila-frame-cbor))
(defun empila-frame-cbor (space kind remaining)
  "Pre: arity verified and depth admitted. Post: one frame added, peak updated.
INVARIANT-VIOLATION for capacity or depth; 102 slots include root and indefinite string."
  (unless (< (spazio-cbor-top space) (1- +cbor-scan-frames+))
    (error 'invariant-violation :reason :cbor-stack-capacity))
  (when (and (<= kind 4) (>= (spazio-cbor-depth space) +cbor-scan-max-depth+))
    (error 'invariant-violation :reason :cbor-stack-depth))
  (incf (spazio-cbor-top space))
  (setf (aref (spazio-cbor-kinds space) (spazio-cbor-top space)) kind
        (aref (spazio-cbor-remaining space) (spazio-cbor-top space)) remaining)
  (when (<= kind 4)
    (incf (spazio-cbor-depth space))
    (setf (spazio-cbor-peak-depth space)
          (max (spazio-cbor-peak-depth space) (spazio-cbor-depth space))))
  nil)

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor) (values null &optional)) inizia-figlio-cbor))
(defun inizia-figlio-cbor (space)
  "Pre: terminal non-tag item admitted by the context. Post: exactly one child consumed.
Chunks do not consume children of the outer container; INVARIANT-VIOLATION for arity/phase."
  (let* ((kind (tipo-frame-cbor space)) (top (spazio-cbor-top space))
         (remaining (aref (spazio-cbor-remaining space) top)))
    (declare (type (integer 0 6) kind) (type (integer 0 101) top) (type u32 remaining))
    (unless (<= remaining +cbor-scan-max-bytes+)
      (error 'invariant-violation :reason :cbor-child-count))
    (when (and (<= kind 2) (zerop remaining))
      (error 'invariant-violation :reason :cbor-child-empty))
    (case kind
      ((0 1 2) (decf (aref (spazio-cbor-remaining space) top)))
      (4 (unless (<= remaining 1)
           (error 'invariant-violation :reason :cbor-map-phase))
         (setf (aref (spazio-cbor-remaining space) top) (- 1 remaining)))
      ((3 5 6) nil)
      (otherwise (error 'invariant-violation :reason :cbor-child-kind)))
    nil))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor index u32) (values boolean &optional)) esito-radice-cbor))
(defun esito-radice-cbor (space end remaining)
  "Pre: root frame and cursor within END. Post: T only for an exact completed root.
CORRUPTION-DETECTED :cbor-trailing before remaining bytes; invariants on arity/depth/tag."
  (unless (<= remaining 1)
    (error 'invariant-violation :reason :cbor-root-state))
  (unless (zerop (spazio-cbor-depth space))
    (error 'invariant-violation :reason :cbor-root-state))
  (when (zerop remaining)
    (when (< (spazio-cbor-cursor space) end)
      (error 'corruption-detected :reason :cbor-trailing :offset (spazio-cbor-cursor space)))
    (when (spazio-cbor-pending-tag space)
      (error 'invariant-violation :reason :cbor-root-tag)))
  (zerop remaining))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor index) (values boolean &optional)) svuota-frame-cbor))
(defun svuota-frame-cbor (space end)
  "Pre: cursor within END. Post: at most 102 pops, T only for root completed at END.
CORRUPTION-DETECTED :cbor-trailing at the cursor before reading the tail;
INVARIANT-VIOLATION for inconsistent range, root/phase, or drain."
  (unless (<= (spazio-cbor-cursor space) end)
    (error 'invariant-violation :reason :cbor-stack-range))
  (loop repeat +cbor-scan-frames+
        do (let* ((kind (tipo-frame-cbor space))
           (remaining (aref (spazio-cbor-remaining space) (spazio-cbor-top space))))
      (declare (type (integer 0 6) kind) (type u32 remaining))
      (cond
        ((zerop kind)
         (return-from svuota-frame-cbor (esito-radice-cbor space end remaining)))
        ((and (<= kind 2) (zerop remaining))
         (when (spazio-cbor-pending-tag space)
           (error 'invariant-violation :reason :cbor-drain-tag))
         (depila-frame-cbor space))
        (t (return-from svuota-frame-cbor nil)))))
  (error 'invariant-violation :reason :cbor-stack-drain))
