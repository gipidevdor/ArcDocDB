;;; OWNER: coordinatore recovery della Serie; set, vettore e capacita' prestati/esclusivi e stabili.
;;; SHARED: cursori scalari privati; nessun array, hash, registro o lock fra Serie.
(in-package #:arcdocdb.recovery.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (recovery-sources active-recuperato simple-vector index)
                         (values control-recuperato index &optional)) verifica-ampiezza-stabilizzazione))
(defun verifica-ampiezza-stabilizzazione (sources active closed max-segments)
  "Pre: stable complete results, same authoritative CONTROL. Post: complete cardinality within budget.
RESOURCE-EXHAUSTED before scans; INVALID-ARGUMENT for count, IO-FAULT for CONTROL not open."
  (let ((control (arcdocdb.recovery.active::active-recuperato-control active))
        (count (numero-fonti-recovery sources)))
    (when (> count max-segments) (error 'resource-exhausted :reason :series-stabilization-segment-budget))
    (unless (= count (1+ (length closed)))
      (error 'invalid-argument :reason :series-stabilization-source-count))
    (unless (= (length closed) (numero-segmenti-chiusi (manifest-control-recuperato control)))
      (error 'invalid-argument :reason :series-stabilization-closed-count))
    (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
    (values control count)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (simple-vector index) arcdocdb.recovery.closed:closed-recuperato)
                token-closed-stabilizzabile))
(defun token-closed-stabilizzabile (closed position)
  "Pre: stable borrowed vector and private cursor. Post: typed CLOSED token at the exact position.
INVALID-ARGUMENT for a missing/incorrect token before effects; no allocation or search."
  (unless (< position (length closed))
    (error 'invalid-argument :reason :series-stabilization-closed-position))
  (let ((token (svref closed position)))
    (unless (typep token 'arcdocdb.recovery.closed:closed-recuperato)
      (error 'invalid-argument :reason :series-stabilization-closed-token))
    token))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-003 REQ-STO-006 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (control-recuperato recovery-sources active-recuperato simple-vector index) index)
                verifica-token-stabilizzazione-serie))
(defun verifica-token-stabilizzazione-serie (control sources active closed count)
  "Pre: complete count admitted, stable sources and vector. Post: position of the unique ACTIVE, including zero.
Strict IDs and cardinality prove completeness; each token matches ID/FD/P/EOF and CONTROL by EQ.
INVALID-ARGUMENT for order/set/authority, per-source check conditions propagated without name I/O."
  (let ((position nil) (previous nil) (next 0))
    (dotimes (i count)
      (multiple-value-bind (id state form file size) (fonte-recovery sources i)
        (declare (ignore form)) ; osservazione iniziale del nome, non esito d'errore.
        (when (and previous (<= id previous))
          (error 'invalid-argument :reason :series-stabilization-source-order))
        (setf previous id)
        (let ((verified
                (case state
                  (:active
                   (when position (error 'invalid-argument :reason :series-stabilization-active-duplicate))
                   (setf position i)
                   (verifica-active-stabilizzabile active file id state size))
                  (:closed
                   (let ((token (token-closed-stabilizzabile closed next)))
                     (incf next)
                     (verifica-closed-stabilizzabile token file id state size)))
                  (otherwise (error 'invariant-violation :reason :series-stabilization-source-state)))))
          (unless (eq verified control)
            (error 'invalid-argument :reason :series-stabilization-control)))))
    (unless position (error 'invalid-argument :reason :series-stabilization-active-missing))
    (unless (= next (length closed)) (error 'invalid-argument :reason :series-stabilization-closed-consumption))
    (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
    position))
