;;; OWNER: compito I/O del recovery, prima di checkpoint/runtime/ammissione; set resta del caller.
;;; SHARED: promozione di un solo nome della Serie, nessun lock o dato condiviso fra Serie.
(in-package #:arcdocdb.recovery.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-003 REQ-STO-006 REQ-AFF-001 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (arcdocdb.io:file-io recovery-sources integer
                          (or active-recuperato arcdocdb.recovery.closed:closed-recuperato)) boolean)
                stabilizza-nome-fonte-recuperata))
(defun stabilizza-nome-fonte-recuperata (directory sources position recovered)
  "Pre: authoritative catalog/CONTROL, semantic source token, exclusive namespace in the I/O pool.
Set and FDs remain live/stable; call after the complete recovery gate, before admitting traffic.
Post: canonical final name of the same FD and synchronized parent; T rename, NIL already final.
Decision already in authoritative EDIT; exclusive rename and fsync complete it, without a new CONTROL swap.
Propagates rejections before effects; incomplete I/O exit => directory FAULTED without retry.
No close, new ACTIVE, removal, index rebuild, or admission; form in the set remains the initial observation."
  (multiple-value-bind (id state form file size) (fonte-recovery sources position)
    (declare (ignore form)) ; snapshot del nome acquisito: il ramo idempotente osserva il namespace reale.
    (let ((control
            (etypecase recovered
              (active-recuperato (verifica-active-stabilizzabile recovered file id state size))
              (arcdocdb.recovery.closed:closed-recuperato
               (verifica-closed-stabilizzabile recovered file id state size)))))
      (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
      (arcdocdb.io:stabilizza-nome-temporaneo
       directory file (arcdocdb.recovery.manifest::nome-fonte-recovery id :temporary)
       (arcdocdb.recovery.manifest::nome-fonte-recovery id :final)))))
