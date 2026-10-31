;;; OWNER: serial engine actor; the existing WAL/SEAL remains the only data commit.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-IDX-001
(declaim (ftype (function (motore octets index index p:contesto-indice (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent :retry-limit)) probe-automatic-index))
(defun probe-automatic-index (engine key start end probe output)
  "Pre: admitted serial owner or private recovery. Post: exact current backend result, no fallback on faults."
  (let ((auto (motore-automatic-index engine)))
    (unless auto (error 'invariant-violation :reason :engine-auto-missing))
    (if (automatic-index-controller-disk auto)
        (d:lookup-disk-index (automatic-index-controller-disk auto) key start end output)
        (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
          (p:leggi-indice-primario (motore-index engine) key start end high low probe output)))))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore (member 1 2) octets index index) null) prepare-automatic-index))
(defun prepare-automatic-index (engine kind key start end)
  "Pre: BUSY write or private recovery, before taking document CSN. Post: appropriate backend has capacity.
Resident grows without disk writes while its maintenance peak fits; disk is selected automatically otherwise."
  (let ((auto (motore-automatic-index engine)))
    (unless (or (motore-busy engine) (eq (motore-state engine) :recovering))
      (error 'invariant-violation :reason :engine-auto-maintenance-admission))
    (when (and (null (automatic-index-controller-disk auto))
               (not (prepare-automatic-resident engine (motore-index engine) kind key start end)))
      (page-automatic-index engine))
    (when (automatic-index-controller-disk auto) (reserve-automatic-disk engine))
    (require-automatic-admission engine))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-WAL-006
(declaim (ftype (function (motore (member 1 2) octets index index u64 u64 index index) null)
                publish-automatic-index))
(defun publish-automatic-index (engine kind key start end csn segment offset bytes)
  "Pre: canonical committed record and capacity reservation. Post: descriptor/counts/source advance together.
No index failure after SEAL can produce ACK; the engine boundary faults and replay recovers the data."
  (unless (and (<= 1 segment #xffffffff) (<= offset #xffffffff) (<= bytes #xffffffff))
    (error 'unsupported-format :reason :engine-location-range))
  (let* ((auto (motore-automatic-index engine)) (tree (automatic-index-controller-disk auto))
         (before (probe-automatic-index engine key start end (motore-index-context engine) (motore-words engine)))
         (present (eq before :live)) (location (logior (ash segment 32) offset)))
    (unless (member before '(:live :absent)) (error 'invariant-violation :reason :engine-auto-lookup-result))
    (if tree (d:apply-disk-index tree kind key start end csn location bytes)
        (apply-automatic-resident engine (motore-index engine) kind key start end csn location bytes))
    (adjust-automatic-cardinality auto kind present (- end start))
    (when tree (verify-automatic-cardinality auto tree))
    (registra-fonte-indice-motore engine csn segment offset bytes)
    (osserva-motore engine :auto-index-updated))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-001
(declaim (ftype (function (automatic-index-controller (member 1 2) boolean index) null) adjust-automatic-cardinality))
(defun adjust-automatic-cardinality (auto kind present size)
  "Pre: exact prior membership and completed mutation. Post: live count/key bytes reflect the one change.
Unknown record kinds are invariant failures; updates do not change cardinality."
  (case kind
    (1 (unless present (incf (automatic-index-controller-count auto)) (incf (automatic-index-controller-key-bytes auto) size)))
    (2 (when present (decf (automatic-index-controller-count auto)) (decf (automatic-index-controller-key-bytes auto) size)))
    (otherwise (error 'invariant-violation :reason :engine-auto-kind)))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (automatic-index-controller d:disk-index) null) verify-automatic-cardinality))
(defun verify-automatic-cardinality (auto tree)
  "Pre: completed disk mutation. Post: independent controller counters equal the published tree statistics.
Mismatch faults admission at the enclosing write/recovery boundary before ACK."
  (unless (= (automatic-index-controller-count auto) (d:disk-index-count tree))
    (error 'invariant-violation :reason :engine-auto-count))
  (unless (= (automatic-index-controller-key-bytes auto) (d:disk-index-key-bytes tree))
    (error 'invariant-violation :reason :engine-auto-key-bytes))
  nil)
