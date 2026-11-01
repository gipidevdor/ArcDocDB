;;;; Cold, bounded sum of disjoint immutable source cuts; no publication protocol.
;;; OWNER: collector owns temporary arrays/hash table; source snapshots are immutable.
;;; SHARED: no source mutation, no worker handshake and no request-path writes (INV-P6).
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (campioni campioni) campioni) %somma-metrica))
(defun %somma-metrica (left right)
  "Pre: bounded nonnegative operands. Post: exact bounded sum; RESOURCE-EXHAUSTED rejects overflow before addition."
  (when (> right (- +massimi-campioni+ left))
    (error 'resource-exhausted :reason :metrics-aggregate-count))
  (+ left right))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (istantanea-metriche) null) %verifica-coerenza-metriche))
(defun %verifica-coerenza-metriche (snapshot)
  "Pre: typed immutable snapshot. Post: count/distribution coherence checked before aggregation.
INVARIANT-VIOLATION identifies inconsistent internal accounting; input arrays are never changed."
  (let ((counts (istantanea-metriche-contatori snapshot))
        (requests (istantanea-metriche-latenza-richieste snapshot))
        (flush (istantanea-metriche-latenza-flush snapshot)))
    (unless (and (= (aref counts +contatore-richieste+) (istantanea-latenze-campioni requests))
                 (<= (aref counts +contatore-errori+) (aref counts +contatore-richieste+))
                 (= (aref counts +contatore-wal-flush+) (istantanea-latenze-campioni flush))
                 (%configurazioni-istogramma-compatibili-p (istantanea-latenze-configurazione requests)
                                                            (istantanea-latenze-configurazione flush)))
      (error 'invariant-violation :reason :metrics-event-population)))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector) null) %verifica-finestre-metriche))
(defun %verifica-finestre-metriche (snapshots)
  "Pre: nonempty bounded input vector. Post: typed coherent snapshots sharing one logical interval.
INVALID-ARGUMENT rejects mixed windows/types; this verifies metadata, not a globally atomic instant."
  (let ((first (%verifica-istantanea-metriche (svref snapshots 0))))
    (loop for snapshot across snapshots do
      (%verifica-istantanea-metriche snapshot)
      (unless (and (= (istantanea-metriche-inizio first) (istantanea-metriche-inizio snapshot))
                   (= (istantanea-metriche-fine first) (istantanea-metriche-fine snapshot)))
        (error 'invalid-argument :reason :metrics-aggregate-window))
      (%verifica-coerenza-metriche snapshot)))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector) simple-vector) %origini-aggregate))
(defun %origini-aggregate (snapshots)
  "Pre: bounded typed snapshots. Post: fresh bounded vector of original disjoint immutable identities.
INVALID-ARGUMENT rejects repeated partitions, including nested overlap; RESOURCE-EXHAUSTED enforces source budget."
  (let ((seen (make-hash-table :test #'equal)) (origins nil) (count 0))
    (loop for snapshot across snapshots do
      (let ((source (istantanea-metriche-origini snapshot)))
        (unless (<= 1 (length source) +massime-fonti-metriche+)
          (error 'invariant-violation :reason :metrics-source-population))
        (loop for origin across source do
          (let ((key (list (fonte-metriche-serie origin) (fonte-metriche-worker origin))))
            (when (gethash key seen) (error 'invalid-argument :reason :metrics-duplicate-source))
            (when (= count +massime-fonti-metriche+)
              (error 'resource-exhausted :reason :metrics-source-budget))
            (setf (gethash key seen) t)
            (incf count) (push origin origins)))))
    (coerce (nreverse origins) 'simple-vector)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector contatori-metrici celle-code) (values maschera-contatori-metrici maschera-code-metriche))
                %somma-contatori-e-code))
(defun %somma-contatori-e-code (snapshots counts queues)
  "Pre: zeroed collector arrays, valid snapshots. Post: exact counts, sampled queue sums, incomplete/known masks.
RESOURCE-EXHAUSTED rejects overflow; unknown queue cells are not treated as observed zeros."
  (let ((incomplete 0) (known (1- (ash 1 +numero-code-metriche+))))
    (loop for snapshot across snapshots do
      (dotimes (index +numero-contatori-metriche+)
        (setf (aref counts index) (%somma-metrica (aref counts index) (aref (istantanea-metriche-contatori snapshot) index))))
      (setf incomplete (logior incomplete (istantanea-metriche-incompleti snapshot))
            known (logand known (istantanea-metriche-code-note snapshot))))
    ;; Only sum a gauge when every source observed it. Hidden partial sums can
    ;; otherwise overflow even though the public result must be :UNOBSERVED.
    (loop for snapshot across snapshots do
      (dotimes (index +numero-celle-code+)
        (when (logbitp (floor index 2) known)
          (setf (aref queues index) (%somma-metrica (aref queues index) (aref (istantanea-metriche-code snapshot) index))))))
    (values incomplete known)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector) (or null identita-serie-metrica)) %serie-aggregata))
(defun %serie-aggregata (origins)
  "Pre: nonempty bounded original identities. Post: common Serie identity, or NIL for multiple Serie."
  (let ((serie (fonte-metriche-serie (svref origins 0))))
    (if (loop for origin across origins always (= serie (fonte-metriche-serie origin))) serie nil)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector boolean) simple-vector) %distribuzioni-metriche))
(defun %distribuzioni-metriche (snapshots flush)
  "Pre: typed bounded immutable cuts. Post: temporary vector of existing latency images, with no source mutation."
  (map 'simple-vector (if flush #'istantanea-metriche-latenza-flush #'istantanea-metriche-latenza-richieste) snapshots))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t) istantanea-metriche) aggrega-metriche))
(defun aggrega-metriche (snapshots)
  "Pre: caller-stable vector of 1..4096 published immutable cuts, disjoint partitions and common window.
Post: independent exact sum and merged distributions. INVALID-ARGUMENT rejects overlap/window/config/type;
RESOURCE-EXHAUSTED rejects count/source overflow. Input state remains unchanged on every failure."
  (unless (and (typep snapshots 'simple-vector) (<= 1 (length snapshots) +massime-fonti-metriche+))
    (error 'invalid-argument :reason :metrics-aggregate-input))
  (%verifica-finestre-metriche snapshots)
  (let ((origins (%origini-aggregate snapshots))
        (counts (make-array +numero-contatori-metriche+ :element-type '(unsigned-byte 64) :initial-element 0))
        (queues (make-array +numero-celle-code+ :element-type '(unsigned-byte 64) :initial-element 0))
        (first (svref snapshots 0)))
    (multiple-value-bind (incomplete known) (%somma-contatori-e-code snapshots counts queues)
      (%make-istantanea-metriche (%serie-aggregata origins)
        (when (= 1 (length origins)) (fonte-metriche-worker (svref origins 0)))
        (istantanea-metriche-inizio first) (istantanea-metriche-fine first) origins counts queues known incomplete
        (unisci-istantanee-latenze (%distribuzioni-metriche snapshots nil))
        (unisci-istantanee-latenze (%distribuzioni-metriche snapshots t))))))
