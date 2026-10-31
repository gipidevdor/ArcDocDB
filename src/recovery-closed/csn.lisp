;;; OWNER: recovery esclusivo della Serie; buffer verificato e manifest canonico stabili.
;;; SHARED: soli massimi scalari; nessuna pubblicazione o mutazione dei registri di Archivio.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (manifest u64 boolean u64) (values boolean u64 &optional)) massimo-csn-chiusura))
(defun massimo-csn-chiusura (manifest id present maximum)
  "Pre: canonical CLOSED with outcome budget already verified; prepared resolution finished.
Post: every CSN in EDIT contributes to the maximum, even without prepared data in the prefix.
INVARIANT-VIOLATION for state, CSN outside u64, or incomplete traversal; no TXID contributes to the maximum."
  (let ((entry (gethash id (arcdocdb.recovery.manifest::%manifest-closed manifest))))
    (unless entry (error 'invariant-violation :reason :closed-recovery-csn-state))
    (let* ((outcomes (arcdocdb.recovery.manifest::%closed-outcomes entry))
           (expected (hash-table-count outcomes)) (used 0))
      (loop for csn being the hash-values of outcomes
            do (unless (typep csn 'u64)
                 (error 'invariant-violation :reason :closed-recovery-csn-value))
               (setf present t maximum (max maximum csn))
               (incf used))
      (unless (= used expected)
        (error 'invariant-violation :reason :closed-recovery-csn-outcomes))))
  (values present maximum))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-CMP-009 REQ-AFF-008
(declaim (ftype (function (octets index (member 1 2) index) (values boolean u64 &optional))
                massimo-csn-compattato))
(defun massimo-csn-compattato (buffer prefix version count)
  "Pre: entire compacted CLOSED verified, authoritative COUNT; stable exclusive scratch.
Post: maximum of ordinary PUT/TOMBSTONE stamps only; no I/O or new body CRCs.
Headers/progress rechecked; INVARIANT-VIOLATION for mismatched shape, count, or consumption.
Exact COUNT loop, already bounded by the verifier; no additional array."
  (check-range buffer arcdocdb.storage.format:+segment-header-bytes+ prefix)
  (unless (<= count (floor (- prefix +segment-header-bytes+) +header-bytes+))
    (error 'invariant-violation :reason :closed-recovery-csn-count))
  (let ((pos +segment-header-bytes+) (maximum 0))
    (declare (type index pos) (type u64 maximum))
    (loop repeat count
          do (multiple-value-bind (next kind flags value-start)
                 (arcdocdb.recovery.active::cornice-active-verificata buffer pos prefix version)
               (declare (ignore value-start)) ; posizione verificata, nessun esito d'errore.
               (unless (and (or (= kind arcdocdb.record:+put+) (= kind arcdocdb.record:+tombstone+))
                            (not (logtest flags arcdocdb.record:+prepared+)))
                 (error 'invariant-violation :reason :closed-recovery-csn-kind :offset pos))
               (setf maximum (max maximum (leggi-u64 buffer (+ pos arcdocdb.record::+stamp-offset+)))
                     pos next)))
    (unless (= pos prefix) (error 'invariant-violation :reason :closed-recovery-csn-consumption :offset pos))
    (values (plusp count) maximum)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-007
(declaim (ftype (function (closed-recuperato) (values boolean u64 &optional))
                massimo-csn-closed-recuperato))
(defun massimo-csn-closed-recuperato (recovered)
  "Pre: complete immutable result. Post: presence and observed maximum, NIL/0 if no CSN.
Includes EDIT and OUTCOME outcomes even without prepared data; no data beyond canonical P contributes.
TYPE-ERROR for invalid types; no proof of future health or traffic admission."
  (values (closed-recuperato-csn-present recovered) (closed-recuperato-max-csn recovered)))
