;;; OWNER: coordinatore costruisce wrapper privati; lo stesso owner fisico conserva i FD.
;;; SHARED: righe readonly riusate, non copiate; nessuna vecchia vista trattenuta dai nuovi wrapper.
(in-package #:arcdocdb.runtime)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (arcdocdb.get:vista-get-serie arcdocdb.get.resolver:mappa-segmento-get)
                         arcdocdb.get.resolver:mappa-segmento-get) trasferisci-mappa-closed-runtime))
(defun trasferisci-mappa-closed-runtime (view map)
  "Pre: canonical map already verified, immutable rows, and readonly FD kept open.
Post: new runtime-view wrappers, same EQ rows/FD and frontier; no physical owner transferred.
INVALID-ARGUMENT for UUID; INVARIANT-VIOLATION for inconsistent internal result. No I/O or publication."
  (let* ((old (arcdocdb.get.resolver::mappa-segmento-get-segment map))
         (rows (arcdocdb.get.resolver::mappa-segmento-get-rows map)))
    (unless (equalp (arcdocdb.get::vista-get-serie-identity view)
                    (arcdocdb.get::vista-get-serie-identity (arcdocdb.get::segmento-get-owner old)))
      (error 'invalid-argument :reason :runtime-closed-transfer-identity))
    (arcdocdb.io::esigi-aperto (arcdocdb.get::segmento-get-file old) :input)
    (let* ((segment (arcdocdb.get::%make-segmento-get
                     view (arcdocdb.get::segmento-get-file old)
                     (arcdocdb.get::segmento-get-high old) (arcdocdb.get::segmento-get-low old)
                     (arcdocdb.get::segmento-get-version old) (arcdocdb.get::segmento-get-origin old)))
           (result (arcdocdb.get.resolver::%make-mappa-segmento-get
                    segment (arcdocdb.get.resolver::mappa-segmento-get-end map) rows)))
      (unless (and (eq (arcdocdb.get::segmento-get-owner segment) view)
                   (eq (arcdocdb.get.resolver::mappa-segmento-get-rows result) rows)
                   (eq (arcdocdb.get::segmento-get-file segment) (arcdocdb.get::segmento-get-file old)))
        (error 'invariant-violation :reason :runtime-closed-transfer-result))
      result)))
