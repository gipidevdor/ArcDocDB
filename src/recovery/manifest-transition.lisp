;;; OWNER: recovery confronta due manifest completi e immutabili prima di qualunque effetto.
;;; SHARED: sole letture delle tabelle possedute; nessun lock o pubblicazione tra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-018
(declaim (ftype (function (manifest u64 manifest-closed) null) verifica-chiuso-conservato))
(defun verifica-chiuso-conservato (current id previous-entry)
  "Pre: complete stable manifests. Post: CLOSED retains exactly equal length and outcomes.
INVALID-ARGUMENT at the first disagreement; presence distinct from zero CSN, u64 without truncation.
Loop bounded by the outcome count of the already verified entry; no modification or I/O."
  (multiple-value-bind (state size count) (trova-segmento current id)
    (unless (and (eq state :closed) (= size (%closed-valid-bytes previous-entry))
                 (= count (hash-table-count (%closed-outcomes previous-entry))))
      (error 'invalid-argument :reason :recovery-closed-changed)))
  (loop for txid being the hash-keys of (%closed-outcomes previous-entry) using (hash-value expected)
        do (multiple-value-bind (present csn) (trova-esito-chiusura current id txid)
             (unless (and present (= csn expected))
               (error 'invalid-argument :reason :recovery-outcome-changed))))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (manifest manifest) null) verifica-forma-transizione-recovery))
(defun verifica-forma-transizione-recovery (previous current)
  "Pre: reconstructed manifests, exclusive recovery without compaction. Post: new ID and closure only of old ACTIVE.
RESOURCE-EXHAUSTED for exhausted IDs; INVALID-ARGUMENT for reuse, lost ACTIVE, or different cardinality.
Does not validate old ACTIVE bytes/outcomes: they come from its authoritative scan."
  (multiple-value-bind (available next) (prossimo-id-segmento previous)
    (unless available (error 'resource-exhausted :reason :recovery-segment-ids))
    (unless (>= (segmento-attivo current) next)
      (error 'invalid-argument :reason :recovery-active-reused)))
  (unless (eq (nth-value 0 (trova-segmento current (segmento-attivo previous))) :closed)
    (error 'invalid-argument :reason :recovery-active-not-closed))
  (unless (and (= (numero-segmenti-chiusi current) (1+ (numero-segmenti-chiusi previous)))
               (= (numero-segmenti-rimossi current) (numero-segmenti-rimossi previous)))
    (error 'invalid-argument :reason :recovery-segment-counts))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-TXM-007 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (manifest manifest) null) verifica-transizione-recovery))
(defun verifica-transizione-recovery (previous current)
  "Pre: complete immutable manifests, new checkpoint closes ACTIVE without CLEAN/MERGE or reclaim.
Post: retains all CLOSED with lengths/outcomes and all REMOVED, closes ACTIVE, opens an ID never reused.
CLOSED count grows by exactly one; no other segment may be inserted/omitted.
Typed transition errors before I/O; does not prove inventory, catalog, or old ACTIVE data.
Loops bounded by CLOSED/REMOVED counts and already verified manifest outcomes; zero durable effects."
  (verifica-forma-transizione-recovery previous current)
  (loop for id being the hash-keys of (%manifest-closed previous) using (hash-value entry)
        do (verifica-chiuso-conservato current id entry))
  (loop for id being the hash-keys of (%manifest-removed previous)
        do (unless (eq (nth-value 0 (trova-segmento current id)) :removed)
             (error 'invalid-argument :reason :recovery-removed-changed)))
  ;; Un secondo controllo locale non promuove le precondizioni di stabilità a una prova concorrente.
  (verifica-forma-transizione-recovery previous current)
  nil)
