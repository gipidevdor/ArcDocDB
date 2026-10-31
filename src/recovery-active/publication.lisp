;;; OWNER: recovery mantiene vecchio ACTIVE, control log e namespace fino alla fine del publisher.
;;; SHARED: confronto in sola lettura, unico gettone nel publisher canonico; nessun lock tra Serie.
(in-package #:arcdocdb.recovery.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-STO-003 REQ-AFF-001
(declaim (ftype (function (control-preparato active-recuperato) null) verifica-chiusura-active))
(defun verifica-chiusura-active (prepared recovered)
  "Pre: exclusive recovery without file or namespace mutations; inventory already reconciled.
Post: checkpoint closes old ACTIVE exactly at P, with all and only derived outcomes.
INVALID-ARGUMENT for length/state/outcomes, IO-FAULT for closed FD; no claim or syscall."
  (arcdocdb.io::esigi-aperto (arcdocdb.get::segmento-get-file (active-recuperato-segment recovered)) :input)
  (let ((manifest (manifest-control-preparato prepared)) (id (id-active-recuperato recovered))
        (ids (active-recuperato-ids recovered)) (csns (active-recuperato-csns recovered)))
    (unless (= (length ids) (length csns)) (error 'invariant-violation :reason :active-recovery-closure-shape))
    (multiple-value-bind (state prefix count) (trova-segmento manifest id)
      (unless (and (eq state :closed) (= prefix (active-recuperato-prefix recovered)) (= count (length ids)))
        (error 'invalid-argument :reason :active-recovery-closure)))
    (dotimes (i (length ids))
      (multiple-value-bind (present csn) (trova-esito-chiusura manifest id (aref ids i))
        (unless (and present (= csn (aref csns i)))
          (error 'invalid-argument :reason :active-recovery-closure-outcome)))))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-TXM-007 REQ-AFF-001 REQ-AFF-018
(declaim (ftype (function (control-preparato active-recuperato) control-pubblicato) pubblica-control-da-active))
(defun pubblica-control-da-active (prepared recovered)
  "Pre: I/O pool, exclusive recovery; inventory/CLOSED verified, files and original table authoritative.
Post: scanner/outcome closure and conservative transition verified, unique publisher completed.
Atomicity point: control log rename; confirmation only after parent fsync by the canonical publisher.
Rejections before claim do not publish; afterward, original errors and publisher FAULTED state.
Does not decide global forgettability, reconstruct indexes, or admit traffic to the Serie."
  (verifica-chiusura-active prepared recovered)
  (pubblica-control-validato prepared (active-recuperato-control recovered)))
