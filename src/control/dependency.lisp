;;; OWNER: controller mantiene ACTIVE esclusivo, senza writer o close concorrenti.
;;; SHARED: sole osservazioni dei legami immutabili; nessuna lettura di H o registro CSN.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (segmento-attivo-preparato) file-io) input-active-checkpoint))
(defun input-active-checkpoint (active)
  "Pre: ACTIVE preparer result. Post: canonical read-only capability, without I/O.
Neither transfers ownership nor certifies current frontier."
  (arcdocdb.get::segmento-get-file (arcdocdb.active::segmento-attivo-preparato-segment active)))

;;; REQ: REQ-AFF-001 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (segmento-attivo-preparato) null) verifica-active-checkpoint))
(defun verifica-active-checkpoint (active)
  "Pre: exclusive startup, before traffic admission. Post: header still sole and durable.
Proof over exact capabilities and log health; INVALID-ARGUMENT for advanced log or file.
IO-FAULT from proof for closed/faulted capability; no syscall or CSN modification."
  (let* ((log (arcdocdb.active::segmento-attivo-preparato-log active))
         (file (arcdocdb.wal::log-io-file log)))
    (verifica-associazione-file (arcdocdb.active::segmento-attivo-preparato-association active)
                               (input-active-checkpoint active) file)
    (unless (eq (stato-log log) :open)
      (error 'invalid-argument :reason :control-active-log))
    (unless (and (= (posizione-scritta file) arcdocdb.storage.format:+segment-header-bytes+)
                 (= (posizione-durevole file) arcdocdb.storage.format:+segment-header-bytes+))
      (error 'invalid-argument :reason :control-active-advanced)))
  nil)

;;; REQ: REQ-FOR-001 REQ-REC-001
(declaim (ftype (function (segmento-attivo-preparato) u64) id-active-checkpoint))
(defun id-active-checkpoint (active)
  "Pre: capability constructed by ACTIVE preparer. Post: identifier from its verified header.
No identity from pathname, descriptor, or derived metadata."
  (let ((segment (arcdocdb.active::segmento-attivo-preparato-segment active)))
    (logior (ash (arcdocdb.get::segmento-get-high segment) 32)
            (arcdocdb.get::segmento-get-low segment))))
