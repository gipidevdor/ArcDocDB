;;; OWNER: visita sincrona nel compito I/O della Serie; nessun buffer o continuation conservato.
;;; SHARED: solo letture di prove readonly; l'effetto del visitor rimane privato fino al gate esterno.
(in-package #:arcdocdb.recovery.replay)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-IDX-006 REQ-AFF-008
(declaim (ftype (function (closed-recuperato index index index index index index) null)
                verifica-consumo-visita-closed))
(defun verifica-consumo-visita-closed (recovered pos records batches data delivered aborted)
  "Pre: bounded traversal finished; private counts, stable canonical proof.
Post: data within record count, exact delivered+aborted counts, canonical frontier and counts reached.
INVARIANT-VIOLATION for a mismatch after any private visitor effects."
  (unless (<= data records) (error 'invariant-violation :reason :recovery-replay-data-count))
  (unless (and (= pos (closed-recuperato-prefix recovered)) (= records (closed-recuperato-records recovered))
               (= batches (closed-recuperato-batches recovered)) (= (+ delivered aborted) data))
    (error 'invariant-violation :reason :recovery-replay-consumption :offset pos))
  nil)

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-IDX-006 REQ-AFF-008
(declaim (ftype (function (closed-recuperato (or null workspace-active) octets function)
                         (values index index &optional)) attraversa-closed-per-visita))
(defun attraversa-closed-per-visita (recovered workspace scratch visitor)
  "Pre: entire prefix and resolution verified, no visitor mutation/reentry on scratch/proofs.
Post: all committed PUT/TOMBSTONE delivered in physical order; OUTCOME/SEAL excluded, aborted records counted.
Exact BATCHES+RECORDS loop and final consumption mandatory; headers reread without repeating body CRCs.
Visitor errors/exits propagated without rollback; no partial result authorizes publication."
  (let* ((prefix (closed-recuperato-prefix recovered))
         (frames (+ (closed-recuperato-batches recovered) (closed-recuperato-records recovered)))
         (pos +segment-header-bytes+) (records 0) (batches 0) (data 0) (delivered 0) (aborted 0))
    (unless (and (<= +segment-header-bytes+ prefix (length scratch))
                 (<= frames (floor (- prefix +segment-header-bytes+) +header-bytes+)))
      (error 'invariant-violation :reason :recovery-replay-frame-count))
    (loop repeat frames
          do (multiple-value-bind (next kind flags value-start)
                 (cornice-active-verificata scratch pos prefix (closed-recuperato-version recovered))
               (declare (ignore value-start)) ; range del valore verificato; nessun esito d'errore.
               (case kind
                 ((#.+put+ #.+tombstone+)
                  (multiple-value-bind (copied skipped)
                      (visita-dato-closed recovered workspace scratch pos next flags visitor)
                    (incf delivered copied) (incf aborted skipped))
                  (incf records) (incf data))
                 (#.+outcome+ (incf records))
                 (#.+seal+ (incf batches))
                 (otherwise (error 'invariant-violation :reason :recovery-replay-kind :offset pos)))
               (setf pos next)))
    (verifica-consumo-visita-closed recovered pos records batches data delivered aborted)
    (values delivered aborted)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-TXM-007 REQ-IDX-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (closed-recuperato octets limiti-recovery-serie function)
                         (values index index &optional)) visita-record-closed-recuperato))
(defun visita-record-closed-recuperato (recovered scratch limits visitor)
  "Pre: canonical CLOSED proof and frozen sources, exclusive scratch and visitor in the I/O pool; admission closed.
Synchronous visitor for committed data only, private destinations and readonly bytes borrowed during the call.
Post: entire P reverified BEFORE the first callback, PUT/TOMBSTONE delivered in order and exact counters.
Prepared from OUTCOME/EDIT, never from the global log; zero/u64 preserved. No file closed or modified.
Original conditions/exits propagated: discard or invalidate the incomplete candidate, no implicit retry."
  (multiple-value-bind (current workspace) (rileggi-closed-per-visita recovered scratch limits)
    (multiple-value-bind (delivered aborted) (attraversa-closed-per-visita current workspace scratch visitor)
      (arcdocdb.io::esigi-aperto (closed-recuperato-input current) :input)
      (arcdocdb.io::esigi-aperto
       (arcdocdb.control::control-recuperato-input (closed-recuperato-control current)) :input)
      (values delivered aborted))))
