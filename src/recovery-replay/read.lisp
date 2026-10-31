;;; OWNER: stesso FD e CONTROL della prova CLOSED; scratch posseduto dal worker per tutta la visita.
;;; SHARED: workspace del reader privato, mai esportato o trattenuto nel risultato pubblico.
(in-package #:arcdocdb.recovery.replay)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (closed-recuperato closed-recuperato) null) verifica-identita-closed-riletto))
(defun verifica-identita-closed-riletto (previous current)
  "Pre: two complete proofs on the same frozen input. Post: authority and geometry unchanged.
INVARIANT-VIOLATION for mismatch before any visitor; no proof based on EOF or name."
  (unless (and (eq (closed-recuperato-control previous) (closed-recuperato-control current))
               (eq (closed-recuperato-input previous) (closed-recuperato-input current)))
    (error 'invariant-violation :reason :recovery-replay-authority))
  (unless (and (= (closed-recuperato-id previous) (closed-recuperato-id current))
               (= (closed-recuperato-prefix previous) (closed-recuperato-prefix current))
               (= (closed-recuperato-version previous) (closed-recuperato-version current))
               (= (closed-recuperato-origin previous) (closed-recuperato-origin current)))
    (error 'invariant-violation :reason :recovery-replay-geometry))
  nil)

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (closed-recuperato closed-recuperato) null) verifica-statistiche-closed-riletto))
(defun verifica-statistiche-closed-riletto (previous current)
  "Pre: complete proofs on the same prefix. Post: counts and maximum CSN unchanged before the visitor.
INVARIANT-VIOLATION for mismatch; metadata comparison does not prove body equality."
  (unless (and (= (closed-recuperato-batches previous) (closed-recuperato-batches current))
               (= (closed-recuperato-records previous) (closed-recuperato-records current))
               (= (closed-recuperato-prepared previous) (closed-recuperato-prepared current))
               (= (closed-recuperato-local previous) (closed-recuperato-local current))
               (= (closed-recuperato-closure previous) (closed-recuperato-closure current))
               (= (closed-recuperato-aborted previous) (closed-recuperato-aborted current)))
    (error 'invariant-violation :reason :recovery-replay-statistics))
  (unless (and (eq (closed-recuperato-csn-present previous) (closed-recuperato-csn-present current))
               (= (closed-recuperato-max-csn previous) (closed-recuperato-max-csn current)))
    (error 'invariant-violation :reason :recovery-replay-csn))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-TXM-007 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (closed-recuperato octets limiti-recovery-serie)
                         (values closed-recuperato (or null workspace-active) &optional)) rileggi-closed-per-visita))
(defun rileggi-closed-per-visita (previous scratch limits)
  "Pre: FD/CONTROL and namespace frozen by the owner, I/O pool and exclusive scratch.
Post: entire P reread and reverified by the canonical reader, resolved workspace reusable without a second collection.
All reader budgets and aliases checked before data; original errors propagate without callback, retry, or close."
  (multiple-value-bind (current workspace)
      (leggi-closed-con-workspace
       (closed-recuperato-control previous) (closed-recuperato-input previous) (closed-recuperato-id previous)
       scratch :chunk-bytes (limits-chunk limits) :max-bytes (limits-bytes limits)
       :max-batches (limits-batches limits) :max-records (limits-records limits)
       :max-batch-records (limits-batch-records limits) :max-batch-bytes (limits-batch-bytes limits)
       :max-prepared (limits-prepared limits) :max-outcomes (limits-outcomes limits)
       :max-esiti-chiusura (limits-closure limits))
    (verifica-identita-closed-riletto previous current)
    (verifica-statistiche-closed-riletto previous current)
    (values current workspace)))
