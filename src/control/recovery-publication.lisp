;;; OWNER: recovery esclusivo mantiene vecchio log, vista e namespace fino alla conclusione del publisher.
;;; SHARED: manifest consultati in sola lettura; il gettone unico resta quello del publisher esistente.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-AFF-001 REQ-AFF-018
(declaim (ftype (function (control-preparato control-recuperato) control-pubblicato)
                pubblica-control-validato))
(defun pubblica-control-validato (prepared recovered)
  "Pre: I/O pool, exclusive recovery; inventory, old ACTIVE, and outcomes already reconciled.
File read and namespace remain unchanged; new closure from old ACTIVE's authoritative prefix.
Post: same canonical view, conservative transition verified before claim/rename; durable result.
Atomicity point: control.log renameat, acknowledgment after parent fsync by canonical publisher.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED/IO-FAULT before claim; afterward errors propagate and token becomes FAULTED.
Does not create a second token, repeat reads, close FDs, admit traffic, or complete Recovery Manager."
  (let* ((active (control-preparato-active prepared))
         (view (arcdocdb.get::segmento-get-owner (arcdocdb.active::segmento-attivo-preparato-segment active)))
         (previous (control-recuperato-input recovered)))
    (unless (eq view (control-recuperato-view recovered))
      (error 'invalid-argument :reason :control-recovery-view))
    (arcdocdb.io::esigi-aperto previous :input)
    (arcdocdb.recovery.manifest:verifica-transizione-recovery
     (control-recuperato-manifest recovered) (control-preparato-manifest prepared))
    (pubblica-control-recuperato prepared previous)))
