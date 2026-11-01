;;; OWNER: compito del pool I/O, da acquisizione a flush; buffer tenuti vivi per tutto il compito.
;;; SHARED: active appartiene al log; CAS senza attesa, nessuna scrittura tra Serie.
(in-package #:arcdocdb.wal)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-WAL-006
(declaim (ftype (function (log-io) null) marca-log-faulted))
(defun marca-log-faulted (log)
  "Pre: controller has retired/completed all I/O tasks for the log, or
the owning task reports its own fault. Post: log terminally FAULTED.
Does not release active or buffers, reopen files, perform I/O, or resolve CSNs."
  (setf (log-io-state log) :faulted)
  nil)

;;; REQ: REQ-WAL-002 REQ-AFF-001
(declaim (ftype (function (gruppo) null) acquisisci-gruppo))
(defun acquisisci-gruppo (group)
  "Pre: ready group and exclusive buffers. Post: only this group owns the log.
RESOURCE-EXHAUSTED if busy; INVALID-ARGUMENT for offset/frontier before writing."
  (esigi-gruppo group :ready)
  (let* ((log (gruppo-log group)) (file (log-io-file log)))
    (unless (null (sb-ext:compare-and-swap (log-io-active log) nil group))
      (error 'resource-exhausted :reason :log-io-busy))
    (handler-case
        (progn
          (verifica-capienza-append file (gruppo-bytes group)
                                   (loop for i below (gruppo-count group)
                                         maximize (lotto-used (the lotto (svref (gruppo-slots group) i)))))
          (unless (= (gruppo-start group) (posizione-scritta file))
            (error 'invalid-argument :reason :group-file-offset))
          (dotimes (i (gruppo-count group))
            (let* ((lotto (the lotto (svref (gruppo-slots group) i)))
                   (seal-start (- (lotto-used lotto) +seal-bytes+)))
              (esigi-lotto lotto :sealed)
              (unless (<= (arcdocdb.binary:leggi-u64 (lotto-buffer lotto)
                                (+ seal-start +seal-durable-offset+)) (posizione-durevole file))
                (error 'invalid-argument :reason :group-future-durable))))
          (setf (gruppo-state group) :writing))
      (invalid-argument (c)
        (unless (eq group (sb-ext:compare-and-swap (log-io-active log) group nil))
          (error 'invariant-violation :reason :group-owner))
        (error c))
      (resource-exhausted (c)
        (unless (eq group (sb-ext:compare-and-swap (log-io-active log) group nil))
          (error 'invariant-violation :reason :group-owner))
        (error c))
      (io-fault (c) (fault-gruppo group) (error c))
      (invariant-violation (c) (fault-gruppo group) (error c))))
  nil)

;;; REQ: REQ-AFF-001 REQ-WAL-006
(declaim (ftype (function (gruppo) null) fault-gruppo))
(defun fault-gruppo (group)
  "Pre: fault in flight. Post: log/group/batches FAULTED, ownership not released.
No retry, no further coverage; the worker propagates the event to the Serie/Archivio."
  (marca-log-faulted (gruppo-log group))
  (setf (gruppo-state group) :faulted)
  (dotimes (i (gruppo-count group))
    (setf (lotto-state (the lotto (svref (gruppo-slots group) i))) :faulted))
  nil)

;;; REQ: REQ-WAL-002 REQ-WAL-006 REQ-AFF-001
(declaim (ftype (function (gruppo &key (:buffer t)) file-offset) scrivi-gruppo))
(defun scrivi-gruppo (group &key buffer)
  "Pre: I/O task, ready group; no mutation/reuse of buffers in flight.
Post: all batches written, not yet durable; ownership remains with the group until flush.
BUFFER optionally combines a small group in exclusive caller scratch; NIL retains per-batch append.
Choice and alias validation precede acquisition; no scratch reference is retained or fallback after I/O.
Prepared SEAL points are appended; every incomplete acquired exit is fail-stop, preserving its cause."
  (let ((buffered (verifica-buffer-gruppo group buffer)) (complete nil))
    (unwind-protect
         (progn
           (acquisisci-gruppo group)
           (let ((end (if buffered (scrivi-buffer-gruppo group (the octets buffer)) (scrivi-lotti-gruppo group))))
             (setf (gruppo-state group) :written complete t) end))
      (when (and (not complete) (eq group (log-io-active (gruppo-log group))))
        (fault-gruppo group)))))

;;; REQ: REQ-WAL-002 REQ-WAL-006 REQ-AFF-001
(declaim (ftype (function (gruppo) file-offset) sincronizza-gruppo))
(defun sincronizza-gruppo (group)
  "Pre: I/O task, write completed and ownership retained. Post: exactly one flush covers the group.
SEAL is the atomic point; this completes durability but does not publish or confirm.
IO-FAULT/INVARIANT-VIOLATION => FAULTED; a second flush of the same group is rejected."
  (esigi-gruppo group :written)
  (let ((log (gruppo-log group)))
    (unless (eq :written (sb-ext:compare-and-swap (gruppo-state group) :written :flushing))
      (error 'resource-exhausted :reason :group-flush-busy))
    (handler-case
        (progn
          (unless (eq (log-io-active log) group)
            (error 'invariant-violation :reason :group-owner))
          (let ((end (durable-flush (log-io-file log))))
            (unless (= end (+ (gruppo-start group) (gruppo-bytes group)))
              (error 'invariant-violation :reason :group-flush-frontier))
            (dotimes (i (gruppo-count group))
              (setf (lotto-state (the lotto (svref (gruppo-slots group) i))) :durable))
            (setf (gruppo-state group) :durable)
            (unless (eq group (sb-ext:compare-and-swap (log-io-active log) group nil))
              (error 'invariant-violation :reason :group-owner))
            end))
      (io-fault (c) (fault-gruppo group) (error c))
      (invariant-violation (c) (fault-gruppo group) (error c)))))

;;; REQ: REQ-WAL-002
(declaim (ftype (function (gruppo) file-offset) esegui-gruppo))
(defun esegui-gruppo (group)
  "Pre: I/O task, ready group. Post: N batches written and one flush; fail-stop on errors.
SEAL preparation already complete; completes durability, never publication/confirmation."
  (scrivi-gruppo group)
  (sincronizza-gruppo group))
