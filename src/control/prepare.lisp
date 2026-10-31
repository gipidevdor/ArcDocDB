;;; OWNER: compito I/O esclusivo; caller mantiene capacità e file anche in caso di errore.
;;; SHARED: nessuna pubblicazione; manifest e piano privati, senza CSN condivisi.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-REC-001 REQ-FOR-003
(declaim (ftype (function (checkpoint-control file-io file-io file-io associazione-file) null)
                verifica-control-completo))
(defun verifica-control-completo (plan input append directory association)
  "Pre: write/flush/reread/parent fsync completed. Post: open dependencies and exact frontiers.
IO-FAULT/INVALID-ARGUMENT from capabilities; INVARIANT-VIOLATION for internal frontiers.
Does not attest to control.log.tmp rename, catalog, or a document decision."
  (verifica-associazione-file association input append)
  (arcdocdb.io::esigi-aperto directory :directory)
  (verifica-active-checkpoint (checkpoint-control-active plan))
  (unless (= (posizione-scritta append) (posizione-durevole append) (lunghezza-checkpoint-control plan))
    (error 'invariant-violation :reason :control-checkpoint-frontier))
  nil)

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-FOR-003 REQ-AFF-001 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (checkpoint-control file-io file-io file-io octets &key (:chunk-bytes index))
                         control-preparato)
                prepara-checkpoint-control))
(defun prepara-checkpoint-control (plan input append directory scratch &key (chunk-bytes 65536))
  "Pre: I/O pool, new O_EXCL control.log.tmp, authoritative parent, and exclusive startup.
Post: canonical file written and durable, reread exactly equal, parent fsync.
Returns complete CONTROL log and manifest; no rename/adoption or client confirmation.
Typed faults propagated without retry/rollback/close; caller handles quarantine/cleanup.
Recovery atomicity point remains the future control log rename, per ADR-0040."
  (verifica-preparazione-control plan input append directory scratch chunk-bytes)
  (let* ((association (associa-file input append))
         (log (crea-log-io append :control 0 :version (checkpoint-control-version plan)))
         (size (lunghezza-checkpoint-control plan)))
    (verifica-file-distinti input (input-active-checkpoint (checkpoint-control-active plan)))
    (scrivi-checkpoint-control plan append chunk-bytes)
    (unless (= (durable-flush append) size)
      (error 'invariant-violation :reason :control-checkpoint-flush))
    (rileggi-checkpoint-control plan input scratch chunk-bytes)
    (unless (zerop (durable-flush directory))
      (error 'invariant-violation :reason :control-checkpoint-directory))
    (verifica-control-completo plan input append directory association)
    (%make-control-preparato log (checkpoint-control-manifest plan) (checkpoint-control-active plan)
                            association directory size)))
