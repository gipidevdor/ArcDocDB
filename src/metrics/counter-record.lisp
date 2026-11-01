;;;; All public event fields change within the existing request-histogram owner scope.
;;; OWNER: one thread per partition; rejected events mark incompleteness without wrapping.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (inline %contatore-disponibile-p %segna-incompleto))
(declaim (ftype (function (metriche-serie indice-contatore-metrico campioni) boolean) %contatore-disponibile-p))
(defun %contatore-disponibile-p (metrics index amount)
  "Pre: validated event under owner scope. Post: whether an unsaturated field fits, without adding first.
Sticky rejection closes an event family until reset, preserving an accepted prefix rather than skipping events."
  (and (not (logbitp index (metriche-serie-incompleti metrics)))
       (<= amount (- (%limite-metriche metrics) (aref (metriche-serie-contatori metrics) index)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (metriche-serie indice-contatore-metrico) null) %segna-incompleto))
(defun %segna-incompleto (metrics index)
  "Pre: entered owner mutation; valid index. Post: sticky incomplete counter bit, no count mutation."
  (setf (metriche-serie-incompleti metrics) (logior (metriche-serie-incompleti metrics) (ash 1 index)))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t &optional t) (member :recorded :above-range :saturated)) registra-richiesta))
(defun registra-richiesta (metrics duration &optional (outcome :ok))
  "Pre: owner submits one completed request and injected duration. Post: matching count/latency or saturation.
INVALID-ARGUMENT precedes mutation. A lost error marks both request and error counts incomplete."
  (let* ((m (%verifica-metriche-owner metrics)) (hist (metriche-serie-latenza-richieste m)))
    (unless (and (typep duration 'latenza) (member outcome '(:ok :errore)))
      (error 'invalid-argument :reason :metrics-request-event))
    (%con-mutazione-istogramma (hist)
      (if (%contatore-disponibile-p m +contatore-richieste+ 1)
          (progn
            (incf (aref (metriche-serie-contatori m) +contatore-richieste+))
            (when (eq outcome :errore) (incf (aref (metriche-serie-contatori m) +contatore-errori+)))
            (%registra-latenza hist duration))
          (progn
            (%segna-incompleto m +contatore-richieste+)
            (when (eq outcome :errore) (%segna-incompleto m +contatore-errori+))
            (setf (istogramma-latenze-saturato-p hist) t)
            :saturated)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t) (member :recorded :saturated)) registra-cache))
(defun registra-cache (metrics outcome)
  "Pre: owner submits one cache event. Post: its counter increments or is marked incomplete at cap.
INVALID-ARGUMENT rejects unknown outcome before mutation; unrelated counters continue after saturation."
  (let* ((m (%verifica-metriche-owner metrics))
         (offset (position outcome #(:hit :miss :espulsione :errore-verifica) :test #'eq)))
    (unless offset (error 'invalid-argument :reason :metrics-cache-event))
    (let ((index (+ +primo-contatore-cache+ offset)))
      (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m))
        (if (%contatore-disponibile-p m index 1)
            (progn (incf (aref (metriche-serie-contatori m) index)) :recorded)
            (progn (%segna-incompleto m index) :saturated))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t) (member :recorded :saturated)) registra-append-wal))
(defun registra-append-wal (metrics bytes)
  "Pre: owner submits nonnegative append bytes. Post: append/byte counts change together or neither does.
INVALID-ARGUMENT precedes mutation. Rejected events mark both fields conservatively incomplete."
  (let ((m (%verifica-metriche-owner metrics)))
    (unless (typep bytes 'campioni) (error 'invalid-argument :reason :metrics-wal-append-event))
    (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m))
      (if (and (%contatore-disponibile-p m +contatore-wal-append+ 1)
               (%contatore-disponibile-p m +contatore-wal-byte+ bytes))
          (progn
            (incf (aref (metriche-serie-contatori m) +contatore-wal-append+))
            (incf (aref (metriche-serie-contatori m) +contatore-wal-byte+) bytes)
            :recorded)
          (progn (%segna-incompleto m +contatore-wal-append+)
                 (%segna-incompleto m +contatore-wal-byte+) :saturated)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t t) (member :recorded :above-range :saturated)) registra-flush-wal))
(defun registra-flush-wal (metrics duration records)
  "Pre: owner submits flush duration and nonnegative group size. Post: flush/group/latency event or rejection.
INVALID-ARGUMENT precedes mutation; any rejected group marks the associated latency incomplete."
  (let* ((m (%verifica-metriche-owner metrics)) (hist (metriche-serie-latenza-flush m)))
    (unless (and (typep duration 'latenza) (typep records 'campioni))
      (error 'invalid-argument :reason :metrics-wal-flush-event))
    (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m))
      (if (and (%contatore-disponibile-p m +contatore-wal-flush+ 1)
               (%contatore-disponibile-p m +contatore-wal-record+ records))
          (progn
            (incf (aref (metriche-serie-contatori m) +contatore-wal-flush+))
            (incf (aref (metriche-serie-contatori m) +contatore-wal-record+) records)
            (%registra-latenza hist duration))
          (progn
            (%segna-incompleto m +contatore-wal-flush+) (%segna-incompleto m +contatore-wal-record+)
            (setf (istogramma-latenze-saturato-p hist) t) :saturated)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t t) metriche-serie) registra-coda))
(defun registra-coda (metrics kind depth)
  "Pre: owner supplies sampled queue depth. Post: known current/peak values within fixed cells.
INVALID-ARGUMENT precedes mutation; unsubmitted intermediate queue depths are not inferred."
  (let* ((m (%verifica-metriche-owner metrics)) (index (%indice-coda kind)) (offset (* 2 index)))
    (unless (typep depth 'campioni) (error 'invalid-argument :reason :metrics-queue-depth))
    (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m))
      (setf (aref (metriche-serie-code m) offset) depth
            (aref (metriche-serie-code m) (1+ offset)) (max depth (aref (metriche-serie-code m) (1+ offset)))
            (metriche-serie-code-note m) (logior (metriche-serie-code-note m) (ash 1 index)))
      m)))
