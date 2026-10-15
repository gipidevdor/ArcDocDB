;;; OWNER: recovery esclusivo della Serie; buffer verificato e manifest canonico stabili.
;;; SHARED: soli massimi scalari; nessuna pubblicazione o mutazione dei registri di Archivio.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (manifest u64 boolean u64) (values boolean u64 &optional)) massimo-csn-chiusura))
(defun massimo-csn-chiusura (manifest id present maximum)
  "Pre: CLOSED canonico con budget esiti già verificato; risoluzione dei prepared terminata.
Post: ogni CSN nell'EDIT contribuisce al massimo, anche senza prepared nel prefisso.
INVARIANT-VIOLATION se il segmento non è CLOSED; nessun TXID contribuisce al massimo."
  (let ((entry (gethash id (arcdocdb.recovery.manifest::%manifest-closed manifest))))
    (unless entry (error 'invariant-violation :reason :closed-recovery-csn-state))
    (loop for csn being the hash-values of (arcdocdb.recovery.manifest::%closed-outcomes entry)
          do (setf present t maximum (max maximum csn))))
  (values present maximum))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-CMP-009 REQ-AFF-008
(declaim (ftype (function (octets index (member 1 2) index) (values boolean u64 &optional))
                massimo-csn-compattato))
(defun massimo-csn-compattato (buffer prefix version count)
  "Pre: intero CLOSED compattato verificato, COUNT autorevole; scratch esclusivo stabile.
Post: massimo dei soli stamp ordinari PUT/TOMBSTONE; nessun I/O o nuovo CRC dei body.
Header/progresso ricontrollati; INVARIANT-VIOLATION per forma, count o consumo discordanti.
Ciclo esatto COUNT, già limitato dal verificatore; nessun array aggiuntivo."
  (check-range buffer arcdocdb.storage.format:+segment-header-bytes+ prefix)
  (unless (<= count (floor (- prefix +segment-header-bytes+) +header-bytes+))
    (error 'invariant-violation :reason :closed-recovery-csn-count))
  (let ((pos +segment-header-bytes+) (maximum 0))
    (declare (type index pos) (type u64 maximum))
    (loop repeat count
          do (multiple-value-bind (next kind flags value-start)
          (arcdocdb.recovery.active::cornice-active-verificata buffer pos prefix version)
        (declare (ignore value-start)) ; posizione già verificata, nessun esito d'errore.
        (unless (and (or (= kind arcdocdb.record:+put+) (= kind arcdocdb.record:+tombstone+))
                     (not (logtest flags arcdocdb.record:+prepared+)))
          (error 'invariant-violation :reason :closed-recovery-csn-kind :offset pos))
        (setf maximum (max maximum (leggi-u64 buffer (+ pos arcdocdb.record::+stamp-offset+))) pos next)))
    (unless (= pos prefix) (error 'invariant-violation :reason :closed-recovery-csn-consumption :offset pos))
    (values (plusp count) maximum)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-TXM-007
(declaim (ftype (function (closed-recuperato) (values boolean u64 &optional))
                massimo-csn-closed-recuperato))
(defun massimo-csn-closed-recuperato (recovered)
  "Pre: risultato completo immutabile. Post: presenza e massimo osservato, NIL/0 se privo di CSN.
Include esiti EDIT e OUTCOME anche senza prepared; nessun dato oltre il P canonico contribuisce.
TYPE-ERROR per tipi invalidi; nessuna prova di salute futura o ammissione del traffico."
  (values (closed-recuperato-csn-present recovered) (closed-recuperato-max-csn recovered)))
