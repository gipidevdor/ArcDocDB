;;; OWNER: writer con lease prepara l'avvio, dopo la decisione EDIT del catalogo.
;;; SHARED: CAS canonico della radice Serie; nessun evento, CSN o syscall.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-FOR-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva t &key (:content t)) radice-get-attiva)
                inizializza-radice-get-attiva))
(defun inizializza-radice-get-attiva (source lease &key (content nil))
  "Pre: new ACTIVE source, lease, durable header, and decided EDIT; admission closed.
Post: empty published/planned root, end=64 and zero pages/PUTs/nodes; borrowed CONTENT.
No I/O, event, or CSN token. The first batch uses this root as PREVIOUS.
INVALID-ARGUMENT for a closed/advanced file or started controller; health/invariants propagate.
The caller retains content and FD under EBR; CAS does not prove the durable EDIT decision."
  (let* ((controller (sorgente-get-attiva-controller source))
         (segment (sorgente-get-attiva-segment source))
         (file (arcdocdb.wal::log-io-file (arcdocdb.series::controllore-serie-log controller))))
    (arcdocdb.series::%check-owner controller lease)
    (arcdocdb.series::%require-healthy controller)
    (unless (and (eq (stato-file (segmento-get-file segment)) :open)
                 (eq (stato-file file) :open))
      (error 'invalid-argument :reason :active-source-file))
    (unless (and (= (arcdocdb.series::controllore-serie-next-offset controller) +segment-header-bytes+)
                 (= (arcdocdb.io:posizione-scritta file) +segment-header-bytes+)
                 (= (arcdocdb.io:posizione-durevole file) +segment-header-bytes+))
      (error 'invalid-argument :reason :active-root-initial-frontier))
    (inizializza-radice-serie controller lease
                            (%make-radice-get-attiva source nil 0 0 0 +segment-header-bytes+ content))))
