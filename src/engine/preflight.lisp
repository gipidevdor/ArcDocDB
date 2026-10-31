;;; OWNER: startup esclusivo; validazione M1 completa prima della prima mutazione del namespace.
;;; SHARED: ordine CSN privato della chiamata; nessun token o contatore operativo assegnato.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-002 REQ-AFF-008
(defun verifica-record-applicativo-motore (engine buffer start end version)
  "Pre: canonical frame already verified; exclusive startup, before effects.
Post: optional profile validator applied to every committed PUT/tombstone.
Receives (kind buffer key-start key-end value-start value-end), borrowed readonly
only during the call; must return NIL, retain no buffer, and not reenter the engine.
An error rejects opening without a checkpoint; this is not a write validator."
  (let ((validator (motore-record-validator engine)))
    (when validator
      (multiple-value-bind (next kind flags ks ke vs ve)
          (arcdocdb.record:verifica-cornice buffer start end :version version)
        (declare (ignore next flags)) ; identita' gia' verificata dal reader canonico.
        (unless (null (funcall validator kind buffer ks ke vs ve))
          (error 'invariant-violation :reason :engine-record-validator-result)))))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (motore c:control-recuperato) u64) verifica-inventario-motore))
(defun verifica-inventario-motore (engine control)
  "Pre: CONTROL and sources verified, lock owned, and no effects. Post: fresh ID reservable by the owner.
Rejects anomalies, conflicts, and missing sources before rename/checkpoint; no deletion or ID reuse."
  (multiple-value-bind (id next plan)
      (mf:scegli-id-segmento-recovery-directory (c:manifest-control-recuperato control) (motore-directory engine)
         :max-segmenti (* 2 (motore-max-segments engine)) :max-files (+ 16 (* 4 (motore-max-segments engine))))
    (unless (and (= next (1+ id)) (eq (mf:stato-riconciliazione plan) :ready))
      (error 'corruption-detected :reason :engine-reconciliation))
    (dotimes (i (mf:numero-azioni-riconciliazione plan))
      (when (member (nth-value 2 (mf:azione-riconciliazione plan i)) '(:anomaly :conflict :missing))
        (error 'corruption-detected :reason :engine-inventory-conflict)))
    (unless (<= 1 id #xffffffff) (error 'resource-exhausted :reason :engine-segment-id-range))
    id))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-AFF-002
(declaim (ftype (function ((or null u64) u64) u64) verifica-csn-ordinario-motore))
(defun verifica-csn-ordinario-motore (previous csn)
  "Pre: ordinary stamp already verified, previous stamp or NIL before the first record.
Post: strict order without wrap/duplicates, zero distinct from absence; corruption before effects."
  (when (and previous (<= csn previous)) (error 'corruption-detected :reason :engine-replay-csn-order))
  csn)

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (motore ra:active-recuperato (or null u64) &optional (or null function)) (or null u64))
                verifica-ordine-active-motore))
(defun verifica-ordine-active-motore (engine active previous &optional visitor)
  "Pre: the canonical reader has just verified the entire ACTIVE in borrowed scratch; stable namespace.
Post: each ordinary record before P follows its predecessor; SEALs excluded, tail not interpreted.
Bounded by bytes/headers; an optional read-only visitor sees only ordinary frames after all checks."
  (let* ((prefix (nth-value 1 (ra:frontiere-active-recuperato active))) (position f:+segment-header-bytes+)
         (version (nth-value 3 (ra:frontiere-active-recuperato active))) (buffer (motore-scratch engine))
         (segment (ra:segmento-active-recuperato active))
         (id (logior (ash (g::segmento-get-high segment) 32) (g::segmento-get-low segment))))
    (loop repeat (floor (- prefix position) arcdocdb.record:+header-bytes+) while (< position prefix) do
      (multiple-value-bind (next kind flags) (arcdocdb.record:verifica-cornice buffer position prefix :version version)
        (unless (and (> next position) (zerop flags))
          (error 'corruption-detected :reason :engine-ordinary-frame))
        (case kind
          ((1 2) (setf previous (verifica-csn-ordinario-motore previous
                                 (b:leggi-u64 buffer (+ position arcdocdb.record::+stamp-offset+))))
                 (verifica-record-applicativo-motore engine buffer position next version)
                 (when visitor
                   (unless (null (funcall visitor buffer position next id position version))
                     (error 'invariant-violation :reason :engine-order-visitor-result))))
          (3 nil)
          (otherwise (error 'unsupported-format :reason :engine-record-outside-m1)))
        (setf position next)))
    (unless (= position prefix) (error 'invariant-violation :reason :engine-active-order-consumption))
    previous))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (motore c:control-recuperato mf::recovery-sources dar:decisioni-recuperate simple-vector
                          &optional (or null function)) null) verifica-ordine-fonti-motore))
(defun verifica-ordine-fonti-motore (engine control sources decisions closed &optional visitor)
  "Pre: all canonical M1 tokens and stable files; admission closed. Post: CSN order across CLOSED and ACTIVE.
Each prefix is reverified; an optional read-only visitor observes verified ordinary frames, with no file effects."
  (let ((previous nil) (cursor 0) (limits (limiti-motore engine)))
    (dotimes (i (mf:numero-fonti-recovery sources))
      (case (nth-value 1 (mf:fonte-recovery sources i))
        (:closed
         (let ((token (the rc:closed-recuperato (svref closed cursor))))
           (incf cursor)
           (arcdocdb.recovery.replay:visita-record-closed-recuperato token (motore-scratch engine) limits
            (lambda (buffer start end segment offset version prepared-csn)
              (when prepared-csn (error 'unsupported-format :reason :engine-prepared-outside-m1))
              (unless (zerop (aref buffer (+ start arcdocdb.record::+flags-offset+)))
                (error 'unsupported-format :reason :engine-record-flags-outside-m1))
              (setf previous (verifica-csn-ordinario-motore previous
                               (b:leggi-u64 buffer (+ start arcdocdb.record::+stamp-offset+))))
              (verifica-record-applicativo-motore engine buffer start end version)
              (when visitor
                (unless (null (funcall visitor buffer start end segment offset version))
                  (error 'invariant-violation :reason :engine-order-visitor-result))) nil))))
        (:active
         (let ((active (rs::recupera-active-serie control sources i decisions (motore-scratch engine) limits)))
           (setf previous (verifica-ordine-active-motore engine active previous visitor))))
        (otherwise (error 'invariant-violation :reason :engine-source-state))))
    (unless (= cursor (length closed)) (error 'invariant-violation :reason :engine-closed-consumption)))
  nil)
