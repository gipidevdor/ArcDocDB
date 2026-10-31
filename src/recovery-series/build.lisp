;;; OWNER: coordinatore esclusivo acquisisce i due risultati solo dopo tutte le verifiche.
;;; SHARED: nessuna pubblicazione di fonti/indici, nessun CSN o dato durevole modificato.
(in-package #:arcdocdb.recovery.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-003 REQ-STO-006 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (control-recuperato recovery-sources decisioni-recuperate octets
                          limiti-recovery-serie) (values active-recuperato simple-vector &optional))
                leggi-serie-recuperata))
(defun leggi-serie-recuperata (control sources decisions scratch limits)
  "Pre: authoritative catalog and CONTROL, owned open set, namespace frozen in I/O task.
Post: ACTIVE plus complete new CLOSED vector in u64 order; same canonical CONTROL and decision replay.
All preflights before data; result only after CLOSED gate, with capabilities and decisions still open.
Original errors without partial results; scratch mutable, FD/set always caller-owned even on error.
No close, rename, index rebuild, CSN, durable point, or traffic admission."
  (multiple-value-bind (position count) (verifica-fonti-serie control sources decisions scratch limits)
    (let ((active (recupera-active-serie control sources position decisions scratch limits))
          (closed (make-array count :initial-element nil)) (next 0))
      (dotimes (i (numero-fonti-recovery sources))
        (unless (= i position)
          (setf (svref closed next) (recupera-closed-serie control sources i scratch limits))
          (incf next)))
      (unless (= next count) (error 'invariant-violation :reason :series-recovery-result-count))
      (verifica-closed-completi control closed :max-segmenti (limits-segments limits))
      (multiple-value-bind (id state form file size) (fonte-recovery sources position)
        (declare (ignore id state form size)) ; già verificati e immutabili; si ricontrolla il FD prestato.
        (arcdocdb.io::esigi-aperto file :input))
      (arcdocdb.recovery.archive::verifica-archivio-active control decisions scratch)
      (values active closed))))
