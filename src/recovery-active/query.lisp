;;; OWNER: controller osserva il risultato immutabile dopo consegna; mantiene il FD readonly fino al reclaim.
;;; SHARED: query scalari e capacità opache; nessun array o workspace esportato.
(in-package #:arcdocdb.recovery.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-009
(declaim (ftype (function (active-recuperato)
                         (values index index (member :complete :tail) (member 1 2) &optional))
                frontiere-active-recuperato))
(defun frontiere-active-recuperato (recovered)
  "Pre: complete result. Post: attested EOF, absolute prefix, state, and verified format.
No proof of current size/health; TYPE-ERROR for invalid types."
  (values (active-recuperato-size recovered) (active-recuperato-prefix recovered)
          (active-recuperato-status recovered) (arcdocdb.get::segmento-get-version (active-recuperato-segment recovered))))

;;; REQ: REQ-REC-001 REQ-TXM-007
(declaim (ftype (function (active-recuperato) (values index index index index index index &optional))
                statistiche-active-recuperato))
(defun statistiche-active-recuperato (recovered)
  "Pre: complete result. Post: batches, records excluding SEAL, distinct prepared TXIDs, local/derived commits, aborts.
Prepared TXIDs = local + derived + aborts; no tail count or exposed table."
  (values (active-recuperato-batches recovered) (active-recuperato-records recovered)
          (active-recuperato-prepared recovered) (active-recuperato-local recovered)
          (length (active-recuperato-ids recovered)) (active-recuperato-aborted recovered)))

;;; REQ: REQ-REC-001 REQ-FOR-001
(declaim (ftype (function (active-recuperato) segmento-get) segmento-active-recuperato))
(defun segmento-active-recuperato (recovered)
  "Pre: complete result. Post: old read-only segment capability from verified FD, without ownership transfer.
Neither makes file CLOSED nor certifies EBR lifetime; caller retains capability until reclamation."
  (active-recuperato-segment recovered))

;;; REQ: REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (active-recuperato u64) (values boolean u64 &optional)) esito-chiusura-active))
(defun esito-chiusura-active (recovered txid)
  "Pre: complete result, u64 TXID. Post: presence and CSN from DECISION to retain in EDIT, NIL/0 if absent.
Absence does NOT classify transaction: it may already have an OUTCOME in the segment. No array exported.
Search bounded to INTEGER-LENGTH(N), INVARIANT-VIOLATION for inconsistent limits or shapes."
  (let* ((ids (active-recuperato-ids recovered)) (csns (active-recuperato-csns recovered))
         (count (length ids)) (left 0) (right count))
    (unless (= count (length csns)) (error 'invariant-violation :reason :active-recovery-query-shape))
    (loop repeat (integer-length count) while (< left right)
          do (let ((middle (+ left (floor (- right left) 2))))
               (unless (<= 0 left middle (1- right) (1- count))
                 (error 'invariant-violation :reason :active-recovery-query-range))
               (let ((actual (aref ids middle)))
                 (cond ((= actual txid) (return-from esito-chiusura-active (values t (aref csns middle))))
                       ((< actual txid) (setf left (1+ middle)))
                       (t (setf right middle))))))
    (when (< left right) (error 'invariant-violation :reason :active-recovery-query-bound))
    (values nil 0)))
