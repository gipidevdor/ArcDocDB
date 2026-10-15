;;; OWNER: workspace semantico privato; esiti CLOSED provengono solo da segmento e manifest canonici.
;;; SHARED: nessuna consultazione di multiserie.log, lock o scrittura condivisa tra Serie.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (workspace-active manifest u64) (values index index index index &optional))
                risolvi-prepared-closed))
(defun risolvi-prepared-closed (workspace manifest id)
  "Pre: prefisso interamente verificato, semantica dei prepared/OUTCOME raccolta, manifest dello stesso CLOSED.
Post: TXID prepared = commit locali + commit solo EDIT + abort, senza decision log globale.
Entrambe le prove presenti devono avere lo stesso CSN; zero e bit alti sono significativi.
CORRUPTION-DETECTED per contraddizione, INVARIANT-VIOLATION per conteggi; nessun workspace esportato."
  (unless (eq (nth-value 0 (trova-segmento manifest id)) :closed)
    (error 'invariant-violation :reason :closed-recovery-resolution-state))
  (let ((prepared (workspace-active-prepared workspace)) (outcomes (workspace-active-outcomes workspace))
        (local 0) (closure 0) (aborted 0))
    (loop for txid being the hash-keys of prepared
          do (multiple-value-bind (local-csn local-present) (gethash txid outcomes)
               (multiple-value-bind (edit-present edit-csn) (trova-esito-chiusura manifest id txid)
                 (when (and local-present edit-present (/= local-csn edit-csn))
                   (error 'corruption-detected :reason :closed-recovery-outcome-conflict))
                 (cond (local-present (incf local))
                       (edit-present (incf closure))
                       (t (incf aborted))))))
    (unless (= (hash-table-count prepared) (+ local closure aborted))
      (error 'invariant-violation :reason :closed-recovery-resolution-count))
    (values (hash-table-count prepared) local closure aborted)))
