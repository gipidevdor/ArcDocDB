;;; OWNER: coordinatore mantiene set, CONTROL, decisioni e scratch esclusivi fino al ritorno.
;;; SHARED: scansione limitata delle fonti readonly; nessuna tabella o vettore allocato qui.
(in-package #:arcdocdb.recovery.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-006 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (control-recuperato recovery-sources decisioni-recuperate octets
                          limiti-recovery-serie) (values index index &optional)) verifica-fonti-serie))
(defun verifica-fonti-serie (control sources decisions scratch limits)
  "Pre: recovery esclusivo, fonti complete e namespace congelato. Post: indice ACTIVE e count CLOSED.
Count, budget riferimenti/byte, ordine u64, appartenenza e preflight di OGNI fonte prima di leggere dati.
Ordine stretto più cardinalità e appartenenza provano completezza senza un'altra tabella dei duplicati.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED o condizioni canoniche; nessuna allocazione del vettore risultato."
  (let* ((count (numero-fonti-recovery sources))
         (closed (numero-segmenti-chiusi (manifest-control-recuperato control))))
    (when (> count (limits-segments limits))
      (error 'resource-exhausted :reason :series-recovery-segment-budget))
    (unless (= count (1+ closed)) (error 'invalid-argument :reason :series-recovery-source-count))
    (when (> (* 8 closed) (limits-references limits))
      (error 'resource-exhausted :reason :series-recovery-reference-budget))
    (arcdocdb.recovery.archive::verifica-archivio-active control decisions scratch)
    (let ((active nil) (previous nil) (total 0))
      (dotimes (i count)
        (multiple-value-bind (id state form file size) (fonte-recovery sources i)
          (declare (ignore form)) ; fatto del planner, non un esito di errore; nessuna rinomina qui.
          (when (and previous (<= id previous))
            (error 'invalid-argument :reason :series-recovery-source-order))
          (setf previous id)
          (when (eq state :active)
            (when active (error 'invalid-argument :reason :series-recovery-active-duplicate))
            (setf active i))
          (incf total (verifica-fonte-serie control file id state size scratch limits))
          (when (> total (limits-total-bytes limits))
            (error 'resource-exhausted :reason :series-recovery-total-byte-budget))))
      (unless active (error 'invalid-argument :reason :series-recovery-active-missing))
      (values active closed))))
