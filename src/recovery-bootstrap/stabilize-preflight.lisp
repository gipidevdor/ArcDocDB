;;; OWNER: coordinatore mantiene tutte le Serie e i risultati canonici aperti, esclusivi e stabili.
;;; SHARED: solo conteggi privati e gate esistenti; nessun piano per fonte o scrittura condivisa.
(in-package #:arcdocdb.recovery.bootstrap)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (simple-vector simple-vector simple-vector index index index) index)
                verifica-capienza-stabilizzazione-archivio))
(defun verifica-capienza-stabilizzazione-archivio (sources active closed count per-series total)
  "Pre: shape/count/types of all rows verified, stable vectors. Post: segment sum admitted.
Canonical cardinalities and budgets include ACTIVE, before source scans and effects.
Canonical guard conditions propagated; no new container or partial result."
  (let ((segments 0))
    (dotimes (i count)
      (multiple-value-bind (control n)
          (arcdocdb.recovery.series::verifica-ampiezza-stabilizzazione
           (the recovery-sources (svref sources i))
           (the arcdocdb.recovery.active:active-recuperato (svref active i))
           (the simple-vector (svref closed i)) per-series)
        (declare (ignore control)) ; guardia del CONTROL gia' eseguita, non esito d'errore.
        (when (> n (- total segments))
          (error 'resource-exhausted :reason :archive-stabilization-segment-budget))
        (incf segments n)))
    (unless (<= count segments total)
      (error 'invariant-violation :reason :archive-stabilization-segment-count))
    segments))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (simple-vector simple-vector simple-vector index index) null)
                verifica-metadata-stabilizzazione-archivio))
(defun verifica-metadata-stabilizzazione-archivio (sources active closed count per-series)
  "Pre: all counts admitted before scans, stable tokens/vectors/FDs. Post: metadata for all sources.
u64 order, unique ACTIVE, CLOSED consumption, and CONTROL/FD/EOF/P reuse per-Serie guards.
No name observed or effect; original conditions propagated without close or retry."
  (dotimes (i count)
    (let ((source (the recovery-sources (svref sources i)))
          (a (the arcdocdb.recovery.active:active-recuperato (svref active i)))
          (c (the simple-vector (svref closed i))))
      (multiple-value-bind (control n)
          (arcdocdb.recovery.series::verifica-ampiezza-stabilizzazione source a c per-series)
        (arcdocdb.recovery.series::verifica-token-stabilizzazione-serie control source a c n))))
  nil)

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (simple-vector simple-vector index) null) verifica-nomi-stabilizzazione-archivio))
(defun verifica-nomi-stabilizzazione-archivio (directories sources count)
  "Pre: metadata for all Serie and canonical Archivio gate complete, exclusive/stable namespaces.
Post: every name/FD for all Serie admitted before the first rename or fsync.
The result does not reserve the namespace; no effect or implicit capability management."
  (dotimes (i count)
    (let ((source (the recovery-sources (svref sources i))))
      (arcdocdb.recovery.series::verifica-nomi-fonti-stabilizzabili
       (the arcdocdb.io:file-io (svref directories i)) source
       (arcdocdb.recovery.manifest:numero-fonti-recovery source))))
  nil)
