;;; OWNER: I/O costruisce il risultato completo; il controller adotta un solo log.
;;; SHARED: wrapper immutabile prima dei compiti, senza buffer o puntatori nativi.
(in-package #:arcdocdb.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-001 REQ-AFF-001 REQ-STO-003
(defstruct (segmento-attivo-preparato
             (:constructor %make-segmento-attivo-preparato (log segment association)) (:copier nil))
  "Pre: new durable writer header, reread equal; directory synchronized by the owner.
Post: three immutable references, without retaining a buffer; no EDIT or ACTIVE published.
The caller retains capabilities and adopts exactly one controller per log, after the catalog decision."
  (log nil :type log-io :read-only t)
  (segment nil :type segmento-get :read-only t)
  (association nil :type associazione-file :read-only t))

;;; REQ: REQ-WAL-002 REQ-AFF-001
(declaim (ftype (function (segmento-attivo-preparato) log-io) log-segmento-attivo-preparato))
(defun log-segmento-attivo-preparato (prepared)
  "Pre: complete result, capabilities still owned. Post: canonical log for exactly one controller.
Does not certify current health, catalog publication, or reader lifetime."
  (segmento-attivo-preparato-log prepared))
