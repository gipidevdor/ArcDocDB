(in-package #:arcdocdb.fulltext.put)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-006 REQ-WAL-005
(declaim (ftype (function (f:riserva-full-text w:lotto) null) verifica-incarnazione-put))
(defun verifica-incarnazione-put (slot batch)
  "Pre: captured binding and typed batch. Post: same WAL-buffer incarnation.
INVALID-ARGUMENT on reuse; an old interval does not prove a new PUT."
  (unless (= (f::riserva-full-text-record-incarnation slot) (w::lotto-incarnation batch))
    (error 'invalid-argument :reason :fulltext-put-stale-batch))
  nil)

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-WAL-005 REQ-CON-002
(declaim (ftype (function (t t t t) (values w:lotto index index index index u32 &optional)) leggi-legame-put-full-text))
(defun leggi-legame-put-full-text (pool lease slot generation)
  "Pre: lease and token transferred by bridge. Post: batch, incarnation, record-number, start,end,row.
NOT a hint map, CSN, prepared outcome, or commit proof. Consumer captures values
before allowing batch reuse; INCARNATION detects obsolete references.
INVALID-ARGUMENT for missing/stale binding; internal invariants make pool FAULTED."
  (f::verifica-writer-riserve pool lease) (f::verifica-token-riserva pool slot generation)
  (unless (and (eq :transferred (f::riserva-full-text-state slot)) (f::riserva-full-text-record-source slot))
    (error 'invalid-argument :reason :fulltext-put-unbound))
  (let ((batch (f::riserva-full-text-record-source slot)) (number (f::riserva-full-text-record-number slot)))
    (unless (typep batch 'w:lotto) (f::errore-interno-riserve pool :fulltext-put-binding-type))
    (verifica-incarnazione-put slot batch)
    (unless (and (not (eq :faulted (w::lotto-state batch))) (< number (w::lotto-count batch))
                 (<= (w::lotto-count batch) (length (w::lotto-offsets batch)))
                 (= (aref (w::lotto-offsets batch) number) (f::riserva-full-text-record-start slot))
                 (< (f::riserva-full-text-record-start slot) (f::riserva-full-text-record-end slot))
                 (<= (f::riserva-full-text-record-end slot) (w::lotto-used batch) (length (w::lotto-buffer batch))))
      (f::errore-interno-riserve pool :fulltext-put-binding-lost))
    (values batch (f::riserva-full-text-record-incarnation slot) number
            (f::riserva-full-text-record-start slot) (f::riserva-full-text-record-end slot) (f::riserva-full-text-row slot))))
