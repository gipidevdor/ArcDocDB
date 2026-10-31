;;; OWNER: coordinatore recovery di una Serie nel pool I/O, prima di checkpoint/ammissione.
;;; SHARED: nomi e cursori locali; nessun lock, thread o contatore condiviso fra Serie.
(in-package #:arcdocdb.recovery.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (arcdocdb.io:file-io recovery-sources index) null)
                verifica-nomi-fonti-stabilizzabili))
(defun verifica-nomi-fonti-stabilizzabili (directory sources count)
  "Pre: metadata for the entire set verified, exclusive/stable namespace. Post: every name/FD admitted.
No rename or fsync even if the last source fails; the boolean is not a reservation.
Original I/O conditions propagated, no new FD or container per source."
  (arcdocdb.io::esigi-aperto directory :directory)
  (dotimes (i count)
    (multiple-value-bind (id state form file size) (fonte-recovery sources i)
      (declare (ignore state form size)) ; metadata gia' verificati, nessun esito di errore.
      (arcdocdb.io:verifica-stabilizzazione-temporaneo
       directory file (arcdocdb.recovery.manifest::nome-fonte-recovery id :temporary)
       (arcdocdb.recovery.manifest::nome-fonte-recovery id :final))))
  (arcdocdb.io::esigi-aperto directory :directory)
  nil)

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-STO-003 REQ-STO-006 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (arcdocdb.io:file-io recovery-sources active-recuperato simple-vector
                          &key (:max-segmenti index)) (values index index &optional))
                stabilizza-nomi-serie-recuperata))
(defun stabilizza-nomi-serie-recuperata (directory sources active closed &key (max-segmenti 65536))
  "Pre: complete Serie/Archivio gates, authoritative CONTROL, exclusive stable set/vector/namespace.
Post: all names final and parent synchronized for each source; two counts: renamed/already final.
All metadata and names verified before effects, then completion per source in u64 ID order.
Decisions already in authoritative EDITs; rename/fsync complete them, no new group atomic point.
Original errors without partial counts or rollback; effects already completed remain completed.
No retry/close/unlink, new ACTIVE, checkpoint, index, CSN, or traffic admission."
  (multiple-value-bind (control count) (verifica-ampiezza-stabilizzazione sources active closed max-segmenti)
    (let ((position (verifica-token-stabilizzazione-serie control sources active closed count))
          (next 0) (renamed 0) (final 0))
      (verifica-nomi-fonti-stabilizzabili directory sources count)
      (dotimes (i count)
        (let ((token (if (= i position) active
                         (prog1 (token-closed-stabilizzabile closed next) (incf next)))))
          (if (stabilizza-nome-fonte-recuperata directory sources i token)
              (incf renamed) (incf final))))
      (unless (= next (length closed)) (error 'invariant-violation :reason :series-stabilization-consumption))
      (unless (= (+ renamed final) count) (error 'invariant-violation :reason :series-stabilization-results))
      (arcdocdb.io::esigi-aperto directory :directory)
      (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
      (values renamed final))))
