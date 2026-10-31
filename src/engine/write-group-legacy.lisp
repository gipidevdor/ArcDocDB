;;; OWNER: serial legacy image/delta admission, before taking any document CSN.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-011 REQ-IDX-012 REQ-WAL-006
(declaim (ftype (function (simple-vector index) boolean) group-unique-key-p))
(defun group-unique-key-p (operations i)
  "Pre: valid descriptors, I<=7. Post: no earlier byte-equal key; no allocation or digest shortcut."
  (not (loop for j below i thereis (group-same-key-p operations i j))))

;;; REQ: REQ-IDX-011 REQ-LIM-003 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index boolean) (values index index &optional)) group-delta-demand))
(defun group-delta-demand (engine operations count empty)
  "Pre: READY owner and healthy delta. Post: cumulative distinct touched-key demand for old or empty delta.
Existing reservations must be published; duplicates consume one membership even when their last operation deletes."
  (let ((delta (motore-delta engine)) (keys 0) (bytes 0))
    (dotimes (i count)
      (when (group-unique-key-p operations i)
        (let ((key (operazione-scrittura-key (svref operations i))) (found nil))
          (unless empty
            (multiple-value-bind (high low)
                (arcdocdb.hash64:xxh64 key 0 (length key) (delta-indice-motore-seed-high delta) (delta-indice-motore-seed-low delta))
              (multiple-value-bind (slot present) (sonda-delta-indice delta key 0 (length key) high low)
                (when present
                  (unless (<= 1 (aref (delta-indice-motore-states delta) (floor slot 4)) 2)
                    (error 'invariant-violation :reason :engine-delta-unpublished-location)))
                (setf found present))))
          (unless found (incf keys) (incf bytes (length key))))))
    (values keys bytes)))

;;; REQ: REQ-IDX-011 REQ-IDX-012 REQ-LIM-003 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index) (or null opzione-indice-paginato)) group-plan-legacy))
(defun group-plan-legacy (engine operations count)
  "Pre: READY owner, validated group and current primary capacity. Post: one cumulative delta/renewal proposal.
Predictable exhaustion preserves READY, files and CSNs. A group too large for an empty delta is never renewed.
One renewal may cover every distinct group key; no membership is reserved during this preflight."
  (let ((delta (motore-delta engine)) (config (motore-auto-renewal engine)))
    (unless delta (return-from group-plan-legacy nil))
    (unless (motore-paged engine) (error 'invariant-violation :reason :engine-delta-without-image))
    (multiple-value-bind (keys bytes) (group-delta-demand engine operations count nil)
      (let ((full (or (> (+ keys (delta-indice-motore-count delta)) (delta-indice-motore-limit delta))
                      (> (+ bytes (delta-indice-motore-used delta)) (length (delta-indice-motore-arena delta))))))
        (when (or full (and config (rinnovo-indice-richiesto-p engine (opzione-rinnovo-automatico-policy config))))
          (unless config (error 'resource-exhausted :reason :engine-delta-capacity))
          (multiple-value-bind (new-keys new-bytes) (group-delta-demand engine operations count t)
            (when (or (> new-keys (delta-indice-motore-limit delta)) (> new-bytes (length (delta-indice-motore-arena delta))))
              (error 'resource-exhausted :reason :engine-delta-capacity)))
          (let ((option (prossima-opzione-rinnovo engine config)))
            (preflight-rinnovo-immagine engine option (opzione-rinnovo-automatico-payload config)
              (opzione-rinnovo-automatico-pages config) (delta-indice-motore-limit delta) (length (delta-indice-motore-arena delta)))
            (return-from group-plan-legacy option))))))
  nil)

;;; REQ: REQ-IDX-011 REQ-IDX-012 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index (or null opzione-indice-paginato)) null) group-prepare-legacy))
(defun group-prepare-legacy (engine operations count renewal)
  "Pre: BUSY owner, cumulative primary/delta preflight. Post: each distinct key reserved once before CSN.
A repeated key does not reread a still-unpublished membership; per-operation publication follows FIFO after flush."
  (when renewal (esegui-rinnovo-automatico-motore engine renewal))
  (if (motore-delta engine)
      (dotimes (i count)
        (when (group-unique-key-p operations i)
          (registra-chiave-delta-motore engine (operazione-scrittura-key (svref operations i)) t)))
      (ritira-indice-paginato-motore engine))
  nil)
