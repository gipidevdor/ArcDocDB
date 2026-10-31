;;; OWNER: builder esclusivo prepara byte in memoria; i preparatori/publisher esistenti mantengono l'I/O.
;;; SHARED: nessuna nuova autorità, CSN, attesa o scrittura tra Serie.
(in-package #:arcdocdb.recovery.checkpoint)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-TXM-007 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (checkpoint-control active-recuperato arcdocdb.recovery.manifest::manifest) null)
                verifica-checkpoint-derivato))
(defun verifica-checkpoint-derivato (plan recovered previous)
  "Pre: canonical plan fully verified in memory. Post: exact conservative transition and ACTIVE closure.
Checks state, P, count, and every derived pair; present zero distinct from absence.
INVARIANT-VIOLATION for differing internal closure; transition errors propagated, no I/O."
  (let* ((manifest (manifest-checkpoint-control plan))
         (id (arcdocdb.recovery.active::id-active-recuperato recovered))
         (ids (arcdocdb.recovery.active::active-recuperato-ids recovered))
         (csns (arcdocdb.recovery.active::active-recuperato-csns recovered)))
    (verifica-transizione-recovery previous manifest)
    (unless (= (length ids) (length csns))
      (error 'invariant-violation :reason :recovery-checkpoint-outcome-shape))
    (multiple-value-bind (state prefix count) (trova-segmento manifest id)
      (unless (and (eq state :closed) (= prefix (arcdocdb.recovery.active::active-recuperato-prefix recovered))
                   (= count (length ids)))
        (error 'invariant-violation :reason :recovery-checkpoint-closure)))
    (dotimes (i (length ids))
      (multiple-value-bind (present csn) (trova-esito-chiusura manifest id (aref ids i))
        (unless (and present (= csn (aref csns i)))
          (error 'invariant-violation :reason :recovery-checkpoint-closure-outcome)))))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-TXM-007 REQ-FOR-003 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (active-recuperato segmento-attivo-preparato u64
                          &key (:max-payload index) (:max-segmenti u32) (:max-esiti u32)
                               (:budget-workspace index)) checkpoint-control) crea-checkpoint-da-active))
(defun crea-checkpoint-da-active (recovered active stamp
                                 &key (max-payload +metadata-max-bytes+) (max-segmenti 65536)
                                      (max-esiti 65536) (budget-workspace 67108864))
  "Pre: exclusive recovery, authoritative CONTROL/ACTIVE, new prepared ACTIVE of the exact same view.
File/FD/namespace frozen until publication; STAMP is caller ordinal, not CSN.
Post: complete owned CONTROL plan, preserves CLOSED/REMOVED/outcomes and closes ACTIVE at P; fresh new ID.
Budgets before arrays; canonical codec, replay, and transition. No I/O, ID reservation, or publication.
Original errors propagated; result only if dependencies still valid. Atomicity remains future rename."
  (multiple-value-bind (manifest id next version) (verifica-fonti-checkpoint recovered active)
    (multiple-value-bind (closed-size removed-size payload-size)
        (misura-payload-checkpoint recovered manifest version max-payload max-segmenti max-esiti budget-workspace)
      (let* ((closed (codifica-chiusi-checkpoint recovered manifest closed-size))
             (removed (codifica-rimossi-checkpoint manifest removed-size))
             (payload (make-array payload-size :element-type '(unsigned-byte 8) :initial-element 0)))
        (unless (= (scrivi-valore-edit payload 0 next id closed (1+ (numero-segmenti-chiusi manifest)) removed
                                      :completo t :max-chiusi max-segmenti :max-rimossi max-segmenti
                                      :max-esiti max-esiti :max-bytes max-payload) payload-size)
          (error 'invariant-violation :reason :recovery-checkpoint-encoding))
        (let ((plan (crea-checkpoint-control active payload stamp :max-payload max-payload
                                           :max-segmenti max-segmenti :max-esiti max-esiti)))
          (verifica-checkpoint-derivato plan recovered manifest)
          (verifica-fonti-checkpoint recovered active)
          plan)))))
